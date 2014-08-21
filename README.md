## Add Rake Tasks

1. Go to gitlab's task folder. Something like `cd /home/git/gitlab/lib/tasks`
2. Download rake task file by running
```
wget https://raw.githubusercontent.com/rahul286/gitlab-bulk-delete-users/master/bulk_delete.rake
```
3. Open file in editor `vim bulk_delete.rake`
4. Change domain from `example.com` to `yourdoamin.com`
5. Comment out `abort()` line#12.

## Run Task

```
sudo -u git -H bundle exec rake gitlab:cleanup:delete_users_except_email_domain RAILS_ENV=production
```
