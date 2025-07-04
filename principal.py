from controller.login import realizar_login

print("\nBem vindo")

login_menu_op = -1

while login_menu_op != 0:
    login_menu_op = realizar_login()

print("\nPrograma encerrado. Volte sempre !")