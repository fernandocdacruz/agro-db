def interface():
    op_menu = -1
    while op_menu != 0:
        menu()
        op_menu = obter_op_menu()
        executar_op(op_menu)

def menu():
    print("\n[0] - Sair")
    print("[1] - Listar Tarefas")
    print("[2] - Adicionar Tarefa")
    print("[3] - Remover Tarefa")

def obter_op_menu():
    while True:
        try:
            op = input("\nOP: ")
            validar_op(op)
            return int(op)
        except ValueError as e:
            print(f"\nErro: {e}")

def validar_op(op):
    if not op:
        raise ValueError("Input em branco. Tente novamente.")
    int_op = int(op)
    if int_op not in [0,1,2,3]:
        raise ValueError("Opção inválida. Tente novamente.")

def executar_op(op: int):
    if op == 1:
        print("Listar Tarefas")
    elif op == 2:
        print("Adicionar Tarefa")
    elif op == 3:
        print("Remover Tarefa")