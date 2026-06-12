* Settings *
Documentation    Suite de testes para o front-end do ServeRest
Library          SeleniumLibrary

* Variables *
${URL_BASE}    https://front.serverest.dev/
${BROWSER}     chrome

* Test Cases *
CT01: Realizar cadastro de usuario com sucesso
    [Documentation]    Testa o fluxo positivo de cadastro de um novo usuário no ServeRest
    Open Browser    ${URL_BASE}cadastrar    ${BROWSER}
    Maximize Browser Window
    
    # Preenchimento de dados
    Input Text      id=nome        Usuario QA Teste
    Input Text      id=email       qa_test_random01@qa.com
    Input Text      id=password    senha123
    
    # Checkbox e Submissão
    Select Checkbox    id=administrador
    Click Button       css=button[data-testid='cadastrar']
    
    # Validação visual do resultado esperado
    Wait Until Page Contains    Cadastro realizado com sucesso    timeout=5s
    Close Browser
