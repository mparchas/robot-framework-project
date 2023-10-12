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
    input_email1 = login_form + "//input[@data-qa='login-email']"
    input_password = login_form + "//input[@data-qa='login-password']"

    signup_form = "xpath://div[@class='signup-form']"
    input_name = signup_form + "//input[@data-qa='signup-name']"
    input_email = signup_form + "//input[@data-qa='signup-email']"

class AccountDetailsPage:
    login_form = "xpath://div[@class='login-form']"
    first_header = "xpath:({}//h2)[1]".format(login_form.split(':')[1])
    second_header = "xpath:({}//h2)[2]".format(login_form.split(':')[1])
    input_password = "xpath://input[@data-qa='password']"
    dropdown_day = login_form + "//select[@data-qa='days']"
    dropdown_month =login_form + "//select[@data-qa='months']"
    dropdown_year = login_form + "//select[@data-qa='years']"
    