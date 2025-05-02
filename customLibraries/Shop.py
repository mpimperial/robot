from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, product_list):
        i = 1
        products = self.sellib.get_webelements("css:.card-title")
        for product in products:
            if product.text in product_list:
                self.sellib.click_button("xpath=(//*[@class='card-footer'])["+str(i)+"]/button")
            i= i + 1
        self.sellib.click_link("css:li.active a")