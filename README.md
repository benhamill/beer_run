    B double-E double-R U N: Beer Run!
    B double-E double-R U N: Beer Run!
    All we need is a ten and a fiver,
    A car and a key and a sober driver.
    B double-E double-R U N: Beer Run!

-- Todd Snider, "Beer Run"

# Beer Run

Each user nominates a prioritized list of their five favorite beers. Beer Run
then uses a [Borda count](http://en.wikipedia.org/wiki/Borda_count) with
[truncated ballots](http://en.wikipedia.org/wiki/Borda_count#Truncated_ballots)
and [multiple
winners](http://en.wikipedia.org/wiki/Borda_count#Multiple_winners) to generate
a list of beers prioritized for maximum average happiness amongst voters.
Enough jargon for you? The point is, it **makes an awesome list of everyone's
favorite beers** and you can buy beer that will **make the group happy**.

## Why?!?

Mostly because after RailsConf 2011, we were excited to try out some new
libraries we'd heard about and some Rails 3.1 features, so we thought up a
simple app to play around with them.

## Help?

Totally:

1. Fork the project.
2. Branch off master.
3. Write some tests.
4. Make 'em pass.
5. Send pull request.
6. Have a beer.

### Setting Up a Dev Environment

Beer Run uses Ruby **1.9.2** and Postgresql. Install those from whichever
source you love the most.

Install gems:

    $ bundle install

Set up the database:

    $ rake db:setup

Run specs:

    # rake spec

If everything's green, you should be good to go.
