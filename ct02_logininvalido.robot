* Settings *
Documentation    Suite de testes de exceção para a tela de login do ServeRest
Library          SeleniumLibrary

* Variables *
${URL_BASE}    https://front.serverest.dev/
${BROWSER}     chrome

* Test Cases *
CT02: Tentativa de login com usuario invalido
    [Documentation]    Testa o comportamento da interface ao inserir dados incorretos
    Open Browser    ${URL_BASE}login    ${BROWSER}
    Maximize Browser Window
    
    # Inserindo dados inválidos propositalmente
    Input Text      id=email       usuario_que_nao_existe@qa.com
    Input Text      id=password    senha_totalmente_errada
    
    # Tentativa de Submissão
    Click Button    css=button[data-testid='entrar']
    
    # Validação da mensagem de erro esperada na tela
    Wait Until Page Contains    Email e/ou senha inválidos    timeout=5s
    Close Browser
