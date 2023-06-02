from nicegui import ui
import datetime


def retrieving_date() -> str:
    return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")


ui.label(retrieving_date())

ui.run()
