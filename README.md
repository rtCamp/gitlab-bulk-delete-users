## Add Rake Tasks

Go to gitlab's task folder. Generally...

```
cd /home/git/gitlab/lib/tasks
```

Download rake task file

```
wget https://raw.githubusercontent.com/rahul286/gitlab-bulk-delete-users/master/bulk_delete.rake
```

Open file in editor

```
vim bulk_delete.rake
```

Change domain from `example.com` to `yourdoamin.com`.


## Rub Task

```
sudo -u git -H bundle exec rake gitlab:cleanup:delete_users_except_email_domain RAILS_ENV=production
```
