# health
#Your Every Day Health

## Setup

### Install brew on OS X (First time setup)
- [Install brew](http://brew.sh/)
- Add brew to your path (`echo 'export PATH="/usr/local/sbin:/usr/local/bin:$PATH"' >> ~/.bash_profile`)
- Restart Terminal
- Check if brew is working correctly (`brew doctor`)

### Requirements
- NodeJS (`brew install node`)
- Ruby (`brew install ruby`)
- Bower (`npm install -g bower`)
- Bundler (`gem install bundler`)

### Install Dependencies
- `npm install`
- `bundle install`
- `bower install`

### Start Server
- `bundle exec middleman` (Always use bundle exec so that the gem versions are picked up correctly)

### Build:
- `middleman build`

### Updating dependencies

- You might need to update dependencies if you see any dependency issue, run the commands used to install dependencies again

## Deployment Details

