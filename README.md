## Add Rake Tasks

1. Go to gitlab's task folder. Something like `cd /home/git/gitlab/lib/tasks`
2. Download rake task file by running
```
wget https://raw.githubusercontent.com/rahul286/gitlab-bulk-delete-users/master/bulk_delete.rake
```
3. Open file in editor `vim bulk_delete.rake`
4. Change domain from `example.com` to `yourdoamin.com`
5. Comment out `abort(...)` [Line#12](https://github.com/rahul286/gitlab-bulk-delete-users/blob/master/bulk_delete.rake#L12).

## Run Task

```
sudo -u git -H bundle exec rake gitlab:cleanup:delete_users_except_email_domain RAILS_ENV=production
```

## Notes

This rake task...

1. will NOT touch users if they are admin OR have email address ending in your `domain`.
1. will DELETE users if they have 0 project AND 0 issue AND 0 note.
1. will BLOCK users if they have any single project OR issue OR note attached.

P.S. I forgot to test if user has snippets while cleaning our Gitlab. But I am 99.999999% sure that no deleted user has ever created any snippet. You will find some codes commented towards end. I ran a for loop on events to verify some users.

I also deleted all users who never logged in. [Line#14-15](https://github.com/rahul286/gitlab-bulk-delete-users/blob/master/bulk_delete.rake#L14-15)

## LICENSE

[DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE](http://www.wtfpl.net/about/)

## Does this interest you?

<a href="https://rtcamp.com/"><img src="https://rtcamp.com/wp-content/uploads/2019/04/github-banner@2x.png" alt="Join us at rtCamp, we specialize in providing high performance enterprise WordPress solutions"></a>
