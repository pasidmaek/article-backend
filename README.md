# Social App (Backend)

## How to Use
You can use one of them `npm`, `yarn`, `pnpm`, `bun`, Example using `npm`:

#install gem
```bash
bundle install
```

#runs server
set master.key
```bash
78d86813597629e7c9a91071664ba0a1
```
run
```bash
rails s
```

#runs test
```bash
rails db:test:prepare
```
```bash
rails test
```

## Model Overview:
- Posts ("/api/v1/posts"):
  -- index => show all post
  -- show_my_post => show only user's post
  -- create => crate post
  -- show[:id] => show post specific by id
  -- update[:id] => update post
  -- destroy[:id] => destroy post

- Authentication ("/login, /signup, /logout"):
  -- login ("/login")
  -- signup ("/signup")
  -- logout ("/logout")
  
## API link (Postman)
```bash
https://elements.getpostman.com/redirect?entityId=26557824-72d6ed4e-4970-4df0-9802-a7fdad015eb3&entityType=collection
```
