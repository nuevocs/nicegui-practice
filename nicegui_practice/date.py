from nicegui import ui
import datetime


def now() -> str:
    return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")


class Button:
    def __init__(self):
        self.button = ui.button("Refresh", on_click=self.retrieving_date)

    def retrieving_date(self):
        ui.label(now())


main = Button()

ui.run()
