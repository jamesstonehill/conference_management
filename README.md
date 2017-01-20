# conference_management

### Notes On My Solution ###



Five basic objects listed in ascending order of granularity:

1. Talk
  * This object stores the duration of the talk as well as the original details of the talk.
2. Session
  * This object stores an array of Talk objects and knows its own duration.  
3. Track
  * The track object stores two sessions. A track represents a full days worth of events. This object acts as a factory, creating the session objects it needs.
4. ConferenceManager (possible will be renamed in future)
  * The conference manager is the object within which you input all the talks. It also acts as an object factory, creating all the tracks needed to store the objects. The number of factories it creates can be specified in the initialize arguments but it defaults to 2 if this argument is left blank.


We also have two types of objects that are responsible for processing the data stored in the Conference Manager into a more schedule like formate. These objects are not totally finished yet but their role is defined as follows:

1. Schedule Builder
  * This object takes a ConferenceManger object as an input and from that input it builds an sort of JSON like object that describes the schedule of the conference.
2. Schedule Exporter
  * This object takes a ScheduleBuilder object as an input and from that input it can perform a variety of tasks that relate to providing human readable formats of the schedule.


#### Code Examples

```ruby

# ==== TALKS =====
talk = Talk.new("Talk Description 45mins")
talk.minutes
# => 45

# OR

talk = Talk.new("Talk Description lightning")
talk.minutes
# => 5

# ==== Session =====

# A session that is three hours long
session = Session.new(60 * 3)

# A session that is four hours long
session = Session.new(60 * 4)

# ==== Track =====

track = Track.new
track.sessions
# => [morning_session, afternoon_session]

# ==== ConferenceManager =====

talks = [talk, talk, talk, talk ...]

conference_manager = ConferenceManager.new(talks)
conference_manager.tracks
# => [track1, track2]

# OR

conference_manager = ConferenceManager.new(talks, 4)
conference_manager.tracks
# => [track1, track2, track3, track4]

```


#### Future Updates

In the future, I might rename the ConferenceManager object to something else and then build another ConferenceManager class that manages all of the objects stated above and provides a single interface for all of them. Then API would look something similar to the following:
```ruby
talks = [*an array of Talk objects]

conference_manager = ConferenceManager.new(talks)

conference_manager.preview_schedule
=> *a schedule printed out to the console


conference_manager.save_schedule('schedule/path/schedule.txt')
# OR
conference_manager.save_schedule
# saves schedule at default location

```

===================================

# The Original Brief

You are planning a conference and have received many proposals which have
passed the initial screen process but you're having trouble fitting them into
the time constraints of the day.
Let's write a program that reads a list of talks and organize them for us.

* The conference has multiple tracks each of which has a morning and afternoon session.  
* Each session contains multiple talks.  
* Morning sessions begin at 9am and must finish by 12 noon, for lunch.  
* Afternoon sessions begin at 1pm and must finish in time for the networking event.  
* The networking event can start no earlier than 4:00 and no later than 5:00.  
* All talk lengths are either in minutes (not hours) or lightning (5 minutes).  


## TEST INPUT
Writing Fast Tests Against Enterprise Rails 60min  
Overdoing it in Python 45min  
Lua for the Masses 30min  
Ruby Errors from Mismatched Gem Versions 45min  
Common Ruby Errors 45min  
Rails for Python Developers lightning  
Communicating Over Distance 60min  
Accounting-Driven Development 45min  
Woah 30min  
Sit Down and Write 30min  
Pair Programming vs Noise 45min  
Rails Magic 60min  
Ruby on Rails: Why We Should Move On 60min  
Clojure Ate Scala (on my project) 45min  
Programming in the Boondocks of Seattle 30min  
Ruby vs. Clojure for Back-End Development 30min  
Ruby on Rails Legacy App Maintenance 60min  
A World Without HackerNews 30min  
User Interface CSS in Rails Apps 30min  

## TEST OUTPUT
**Track 1:**  
09:00AM Writing Fast Tests Against Enterprise Rails 60min  
10:00AM Overdoing it in Python 45min  
10:45AM Lua for the Masses 30min  
11:15AM Ruby Errors from Mismatched Gem Versions 45min  

12:00PM Lunch  

01:00PM Ruby on Rails: Why We Should Move On 60min  
02:00PM Common Ruby Errors 45min  
02:45PM Pair Programming vs Noise 45min  
03:30PM Programming in the Boondocks of Seattle 30min  
04:00PM Ruby vs. Clojure for Back-End Development 30min  
04:30PM User Interface CSS in Rails Apps 30min  

05:00PM Networking Event  

**Track 2:**  
09:00AM Communicating Over Distance 60min  
10:00AM Rails Magic 60min  
11:00AM Woah 30min  
11:30AM Sit Down and Write 30min  

12:00PM Lunch  

01:00PM Accounting-Driven Development 45min  
01:45PM Clojure Ate Scala (on my project) 45min  
02:30PM A World Without HackerNews 30min  
03:00PM Ruby on Rails Legacy App Maintenance 60min  
04:00PM Rails for Python Developers lightning  

05:00PM Networking Event  
