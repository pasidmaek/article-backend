# Social App (Backend)

## How to Use
You can use one of them `npm`, `yarn`, `pnpm`, `bun`, Example using `npm`:

#install gem
```bash
bundle install
```

#runs server
```bash
rails db:migrate
```
for create database first (OPTIONAL)
```bash
rails db:seed
```
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
https://www.postman.com/lunar-escape-852747/workspace/app/request/26557824-778635d9-7e29-4ac7-b3ff-d3ef9909f34c
```
