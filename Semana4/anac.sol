pragma solidity ^0.8.0;

contract Anac {
    //Passo 1 (5 pontos): Adicione uma variável de estado ao contrato: idade.
    uint public idade = 18; //por padrão uma instância deste contrato é de uma
    //pessoa com 18 anos de idade.

    //Adicione uma variável que armazena o endereço dono do contrato
    address public dono; 

    // evento que ocorre quando uma nova idade é inserida
    event idadeNova(uint novaIdade);

    // Modificador necessário para receber o endereço do dono. Utilizado quando
    // apenas o dono pode ter permissão para chamar a função
    modifier apenasDono() {
        require(msg.sender == dono, "Somente_o_dono_pode_chamar_esta_funcao");
        _;
    }

    // Armazena o endereço do dono
    constructor() {
        dono = msg.sender;
    }

    // Função responsável por receber a nova idade e substituir a idade antiga
    // Essa função pode ser chamada apenas pelo dono
    // Utiliza o event idadeNova
    function setIdade(uint _novaIdade) public apenasDono {
        idade = _novaIdade;
        emit idadeNova(idade);
    }

    // Função responsável por devolver a idade. Pode ser chamada por todos
    function getIdade() public view returns (uint) {
        return idade;
    }
}
