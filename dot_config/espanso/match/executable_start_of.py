#!/usr/local/bin/python3

import sys
from datetime import datetime, timedelta
from typing import Literal

from zoneinfo import ZoneInfo


def start_of(
    when: Literal["yesterday", "today", "tomorrow"],
    timezone: str = "Europe/Amsterdam",
) -> str:
    time_now: datetime = datetime.now(ZoneInfo(timezone))

    start_of_today: datetime = time_now.replace(
        hour=0, minute=0, second=0, microsecond=0
    )

    match when:
        case "yesterday":
            start: datetime = start_of_today - timedelta(days=1)
        case "today":
            start = start_of_today
        case "tomorrow":
            start = start_of_today + timedelta(days=1)

    start_utc: datetime = start.astimezone(ZoneInfo("UTC"))

    return start_utc.isoformat()

if __name__ == "__main__":
    print(start_of(sys.argv[1]))
