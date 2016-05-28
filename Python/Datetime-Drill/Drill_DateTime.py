import datetime
import pytz

current = datetime.datetime.utcnow()

tz_pdx = pytz.timezone('America/Los_Angeles')
tz_ny = pytz.timezone('America/New_York')
tz_ldn = pytz.timezone('Europe/London')

pdx = pytz.utc.localize(current, is_dst=None).astimezone(tz_pdx)
ny = pytz.utc.localize(current, is_dst=None).astimezone(tz_ny)
ldn = pytz.utc.localize(current, is_dst=None).astimezone(tz_ldn)


def DateTime():

    print ('BRANCHES OPEN FROM 0900 - 2100')

    if pdx.hour >= 9 and pdx.hour < 21:
        print('Portland Branch: OPEN')
    else:
        print('Portland Branch: CLOSED')
    print(pdx)

    if ny.hour >= 9 and ny.hour < 21:
        print('New York Branch: OPEN')
    else:
        print('New York Branch: CLOSED')
    print(ny)

    if ldn.hour >= 9 and ldn.hour < 21:
        print('London Branch: OPEN')
    else:
        print('London Branch: CLOSED')
    print(ldn)


DateTime()
