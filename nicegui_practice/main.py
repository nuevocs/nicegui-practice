from nicegui import ui
import datetime


def now() -> str:
    return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")


class Button:
    def __init__(self):
        self.button = ui.button("Refresh", on_click=self.retrieving_date)
        self.label = ui.label(text="")

    def retrieving_date(self):
        self.label.text = now()
        self.label.update()


main = Button()

ui.run()
