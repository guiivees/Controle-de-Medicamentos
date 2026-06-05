*** Settings ***
Library    SeleniumLibrary

Suite Setup       Dado que o cuidador acessa a tela de cadastro de medicamento
Suite Teardown    E fecha o navegador

*** Variables ***
${URL}                 file:///C:/faculdade/teste/index.html
${BROWSER}             chrome

${INPUT_NOME}          id=nome
${INPUT_DOSE}          id=dose
${INPUT_HORARIO}       id=horario
${INPUT_QUANTIDADE}    id=quantidade
${BOTAO_CADASTRAR}     id=btnCadastrar
${MENSAGEM}            id=mensagem

*** Test Cases ***
CT01 - Deve cadastrar medicamento com dados válidos
    Recarregar pagina
    Dado que o cuidador informa o nome           Paracetamol
    E informa a dose                             500mg
    E informa o horario                          0800
    E informa a quantidade                       30
    Quando solicitar o cadastro
    Então o sistema deve apresentar a mensagem   Medicamento cadastrado com sucesso

CT02 - Deve validar nome obrigatório
    Recarregar pagina
    Dado que o cuidador informa o nome
    E informa a dose                             500mg
    E informa o horario                          0800
    E informa a quantidade                       30
    Quando solicitar o cadastro
    Então o sistema deve apresentar a mensagem   Nome é obrigatório

CT03 - Deve validar dose obrigatória
    Recarregar pagina
    Dado que o cuidador informa o nome           Paracetamol
    E informa a dose
    E informa o horario                          0800
    E informa a quantidade                       30
    Quando solicitar o cadastro
    Então o sistema deve apresentar a mensagem   Dose é obrigatória

CT04 - Deve validar horário obrigatório
    Recarregar pagina
    Dado que o cuidador informa o nome           Paracetamol
    E informa a dose                             500mg
    E informa o horario
    E informa a quantidade                       30
    Quando solicitar o cadastro
    Então o sistema deve apresentar a mensagem   Horário é obrigatório

CT05 - Deve validar quantidade inválida
    Recarregar pagina
    Dado que o cuidador informa o nome           Paracetamol
    E informa a dose                             500mg
    E informa o horario                          0800
    E informa a quantidade                       0
    Quando solicitar o cadastro
    Então o sistema deve apresentar a mensagem   Quantidade deve ser maior que zero

*** Keywords ***
Dado que o cuidador acessa a tela de cadastro de medicamento
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_NOME}    timeout=10s

Recarregar pagina
    Go To    ${URL}
    Wait Until Element Is Visible    ${INPUT_NOME}    timeout=10s

Dado que o cuidador informa o nome
    [Arguments]    ${nome}=${EMPTY}
    Run Keyword If    '${nome}' != '${EMPTY}'    Input Text    ${INPUT_NOME}    ${nome}

E informa a dose
    [Arguments]    ${dose}=${EMPTY}
    Run Keyword If    '${dose}' != '${EMPTY}'    Input Text    ${INPUT_DOSE}    ${dose}

E informa o horario
    [Arguments]    ${horario}=${EMPTY}
    Run Keyword If    '${horario}' != '${EMPTY}'    Input Text    ${INPUT_HORARIO}    ${horario}

E informa a quantidade
    [Arguments]    ${quantidade}=${EMPTY}
    Run Keyword If    '${quantidade}' != '${EMPTY}'    Input Text    ${INPUT_QUANTIDADE}    ${quantidade}

Quando solicitar o cadastro
    Click Button    ${BOTAO_CADASTRAR}
    Sleep    1s

Então o sistema deve apresentar a mensagem
    [Arguments]    ${mensagem_esperada}
    Sleep    1s
    ${texto}=    Execute Javascript    return document.getElementById('mensagem').innerText;
    Should Be Equal    ${texto}    ${mensagem_esperada}

E fecha o navegador
    Close Browser
