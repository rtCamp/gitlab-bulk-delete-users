namespace :gitlab do
  namespace :cleanup do

    desc "GITLAB | Delete all users who are not from domain example.com"

    task delete_users_except_email_domain: :environment  do |t, args|

	    ## set your domain name here
	    domain = 'example.com'

        ## comment out following line
        abort("Comment out line #12 in file lib/tasks/bulk_delete.rake to proceed")

        ## UNCOMMENT following delete all users who never signed in
        ## users = User.where('email NOT LIKE ? AND sign_in_count = 0 ', '%' + domain).destroy_all

		## get all users whose email address doesn't have above domain and they are not admin
	    users = User.where('email NOT LIKE ? AND admin = false ', '%' + domain)

		if users.present?
				puts " #{users.size} users found"
				users.each do |user|
					puts "\n\n#{user.id} - #{user.username} - #{user.email} - #{user.state}"

					## Get Project Count
					project_count = Project.where('creator_id = ?',user.id).size
					#puts "User #{user.id} has #{project_count} projects" unless project_count.zero?

					## Get Issues Count
					issue_count = Issue.where('author_id = ?',user.id).size
					#puts "User #{user.id} has #{issue_count} issues" unless issue_count.zero?

					## Get Notes Count
					notes_count = Note.where('author_id = ?',user.id).size
					#puts "User #{user.id} has #{notes_count} notes" unless notes_count.zero?

					## Print Summary
					puts "User #{user.id} has #{issue_count} issues, #{notes_count} notes, #{project_count} projects"

					## Check safe to delete
					if issue_count.zero? and notes_count.zero? and project_count.zero?
						## Delete user
						puts "Deleting User #{user.id} - #{user.username} - #{user.email}"
						user.destroy
					else
						## Block User
						puts "Blocking User #{user.id} - #{user.username} - #{user.email}"
						user.state = "blocked"
						user.save
					end
				end #end of users loop
		end #end of if
    end #end of task
  end
end

# 			## Get Events Count
# 			event_count = Event.where('author_id = ?',user.id).size
# 			puts "User #{user.id} has #{event_count} events"
#
# 			if event_count.zero?
# 				puts "User #{user.id} can be SURELY DELETED.\n\n"
# 			else
# 				puts "User #{user.id} can be DELETED.\n\n"
# 			end
