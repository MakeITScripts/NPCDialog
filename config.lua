Config = {}
Config.Debug = true
Config.Color = "#3a85f7" -- example color, change it to yours
Config.Locale = { -- strings used in script (you can change it into your own language)
    Talk = "Talk...",
    CurrentlyTalking = "This pedestrian is currently talking...",
    Pedestrian = "Pedestrian",
    NotifyTitle = "Notification" -- only used for ox notify
}
-- firstnames and lastnames used for random names
Config.FirstNames = {
    M = {"James", "John", "Robert", "Michael", "William", "David", "Richard", "Joseph", "Charles", "Thomas",
         "Christopher", "Daniel", "Matthew", "Anthony", "Mark", "Donald", "Steven", "Paul", "Andrew", "Joshua",
         "Kenneth", "Kevin", "Brian", "George", "Edward", "Ronald", "Timothy", "Jason", "Jeffrey", "Ryan", "Jacob",
         "Gary", "Nicholas", "Eric", "Stephen", "Jonathan", "Larry", "Justin", "Scott", "Brandon", "Frank", "Benjamin",
         "Gregory", "Samuel", "Raymond", "Patrick", "Alexander", "Jack", "Dennis", "Jerry", "Tyler", "Aaron", "Henry",
         "Douglas", "Peter", "Jose", "Adam", "Zachary", "Walter", "Nathan", "Harold", "Kyle", "Carl", "Arthur",
         "Gerald", "Roger", "Keith", "Jeremy", "Lawrence", "Terry", "Sean", "Albert", "Joe", "Christian", "Austin",
         "Willie", "Jesse", "Ethan", "Billy", "Bruce", "Bryan", "Ralph", "Roy", "Jordan", "Eugene", "Wayne", "Louis",
         "Dylan", "Alan", "Juan", "Noah", "Russell", "Harry", "Randy", "Philip", "Vincent", "Gabriel", "Bobby",
         "Johnny", "Howard", "Martin", "Ernest", "Stanley", "Bernard", "Caleb", "Mason", "Kenny", "Curtis", "Allen",
         "Leonard", "Norman", "Oscar"},
    F = {"Mary", "Patricia", "Jennifer", "Linda", "Elizabeth", "Barbara", "Susan", "Jessica", "Sarah", "Karen", "Nancy",
         "Lisa", "Betty", "Margaret", "Sandra", "Ashley", "Kimberly", "Emily", "Donna", "Michelle", "Dorothy", "Carol",
         "Amanda", "Melissa", "Deborah", "Stephanie", "Rebecca", "Sharon", "Laura", "Cynthia", "Kathleen", "Amy",
         "Shirley", "Angela", "Helen", "Anna", "Brenda", "Pamela", "Nicole", "Samantha", "Katherine", "Christine",
         "Debra", "Rachel", "Catherine", "Carolyn", "Janet", "Ruth", "Maria", "Heather", "Diane", "Virginia", "Julie",
         "Joyce", "Victoria", "Olivia", "Kelly", "Christina", "Lauren", "Joan", "Evelyn", "Judith", "Megan", "Cheryl",
         "Andrea", "Hannah", "Martha", "Jacqueline", "Frances", "Gloria", "Ann", "Teresa", "Kathryn", "Sara", "Janice",
         "Jean", "Alice", "Madison", "Doris", "Abigail", "Julia", "Judy", "Grace", "Denise", "Amber", "Marilyn",
         "Beverly", "Danielle", "Theresa", "Sophia", "Marie", "Diana", "Brittany", "Natalie", "Isabella", "Charlotte",
         "Rose", "Alexis", "Kayla", "Ann", "Ruby", "Lois", "Irene", "Catherine", "Laura", "Emily", "Lillian", "Helen",
         "Samantha", "April", "Annie", "Angela"}
}

Config.LastNames = {"Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor",
                    "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez",
                    "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez",
                    "King", "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson",
                    "Carter", "Mitchell", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans",
                    "Edwards", "Collins", "Stewart", "Sanchez", "Morris", "Rogers", "Reed", "Cook", "Morgan", "Bell",
                    "Murphy", "Bailey", "Rivera", "Cooper", "Richardson", "Cox", "Howard", "Ward", "Torres", "Peterson",
                    "Gray", "Ramirez", "James", "Watson", "Brooks", "Kelly", "Sanders", "Price", "Bennett", "Wood",
                    "Barnes", "Ross", "Henderson", "Coleman", "Jenkins", "Perry", "Powell", "Long", "Patterson",
                    "Hughes", "Flores", "Washington", "Butler", "Simmons", "Foster", "Gonzales", "Bryant", "Alexander",
                    "Russell", "Griffin", "Diaz", "Hayes", "Gouda"}
Config.ToggleRandomDialogs = true
Config.Dialogs = {{
    id = "weather_talk",
    startText = "start",
    Texts = {
        start = {
            text = "Nice weather today, huh? Finally some sun after that week of rain.",
            options = {{
                text = "Yeah, finally we can go out without an umbrella.",
                next = "agree"
            }, {
                text = "Too hot for me though.",
                next = "disagree"
            }}
        },
        agree = {
            text = "Exactly! Maybe my laundry will finally dry on the balcony.",
            options = {}
        },
        disagree = {
            text = "Oh come on, a little sun never hurt anyone!",
            options = {}
        }
    }
}, {
    id = "noise_complaint",
    startText = "start",
    Texts = {
        start = {
            text = "Something was banging outside again last night, I couldn’t sleep!",
            options = {{
                text = "Probably the wind, it’s been really strong lately.",
                next = "wind"
            }, {
                text = "Maybe those kids from the neighborhood again.",
                next = "kids"
            }}
        },
        wind = {
            text = "You might be right... But it sounded like someone was hitting the trash bins!",
            options = {}
        },
        kids = {
            text = "Heh, could be... I saw them running around with firecrackers in the yard.",
            options = {}
        }
    }
}, {
    id = "police_complaint",
    startText = "start",
    Texts = {
        start = {
            text = "Did you see that? Someone was sneaking around the cars again, and the cops did nothing!",
            options = {{
                text = "Yeah, I saw it. They should really do something about it.",
                next = "agree"
            }, {
                text = "Eh, it’s always been like that.",
                next = "shrug"
            }}
        },
        agree = {
            text = "Exactly! We pay taxes, and they just sit at the station drinking coffee.",
            options = {}
        },
        shrug = {
            text = "Yeah, in this city that’s just normal...",
            options = {}
        }
    }
}, {
    id = "traffic_talk",
    startText = "start",
    Texts = {
        start = {
            text = "The traffic jams today were insane... I stood half an hour at a red light!",
            options = {{
                text = "Yeah, downtown is a nightmare these days.",
                next = "agree"
            }, {
                text = "You should’ve taken the side streets.",
                next = "tip"
            }}
        },
        agree = {
            text = "Exactly! I thought I’d never get out of there.",
            options = {}
        },
        tip = {
            text = "I’ll do that next time, maybe I’ll save some nerves.",
            options = {}
        }
    }
}, {
    id = "random_chat",
    startText = "start",
    Texts = {
        start = {
            text = "Bread got more expensive again yesterday! That’s ridiculous.",
            options = {{
                text = "Yeah, everything’s getting more expensive...",
                next = "agree"
            }, {
                text = "Heh, at least they haven’t raised coffee prices yet.",
                next = "joke"
            }}
        },
        agree = {
            text = "Soon even bread rolls will be a luxury...",
            options = {}
        },
        joke = {
            text = "Haha, true! I wouldn’t survive a morning without coffee.",
            options = {
                action = "close"
            }
        }
    }
}}
Config.forcedInteractions = {{
    pedSpawn = "cs_hunter",
    coords = vec4(1336.8647, 4224.4551, 33.9145 - .95, 211.2772),
    anim = "WORLD_HUMAN_STAND_FISHING", -- not necesary
    pedName = "Moe Ron",
    targetTitle = "Talk about fishes", -- isnt necesary, if you dont give it it will just display Config.Locale.Talk
    pedJob = "Local FisherMan",
    scenarios = {
        id = "fisherman",
        startText = "start",
        Texts = {
            start = {
                text = "Do you want to get some fish from me?",
                options = {{
                    text = "Of course!",
                    next = "buy_fish"
                }, {
                    text = "I dont want fish!",
                    next = "i_dont_want"
                }}
            },
            buy_fish = {
                text = "Here have some!",
                options = {{
                    text = "Thanks a lot!",
                    action = "function",
                    functions = "give_fish"
                }}
            },
            i_dont_want = {
                text = "Come on get some!",
                options = {{
                    text = "NO! GET OFF ME!",
                    action = "close"
                }}
            }
        }
    }
}}
