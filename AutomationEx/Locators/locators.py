class HomePage:
    # Navbar
    main_navbar = "xpath://div[contains(@class, 'shop-menu')]//ul"
    home = main_navbar + "//a[@href='/']"
    products = main_navbar + "//a[@href='/products']"
    cart = main_navbar + "//a[@href='/view_cart']"
    signup_login = main_navbar + "//a[@href='/login']"
    contact_us = main_navbar + "//a[@href='/contact_us']"

    # Page Content
    feature_items = "xpath://div[@class='features_items']"


class SignupLoginPage:
    login_form = "xpath://div[@class='login-form']"
    signup_form = "xpath://div[@class='signup-form']"