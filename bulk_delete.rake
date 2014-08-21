namespace :gitlab do
  namespace :cleanup do

    desc "GITLAB | Delete all users who are not from domain example.com"

    task delete_users_except_email_domain: :environment  do |t, args|
	puts YAML::dump(Issue.where('author_id = 261').count)
#	puts YAML::dump(Note.where('author_id = 261'))
exit

      domain = 'xrtcamp.com'
      users = User.where('email NOT LIKE ? AND admin = false ', '%' + domain)#.destroy_all

	if users.present?
		puts " #{users.size} users"
		users.each do |user|
			puts YAML::dump(user.email)
			puts user.sign_in_count
		end
	else
		puts "no user found"
	end
     
	  
    end

  end
end
