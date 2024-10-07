// FUNÇÃO PARA CARREGAR O CARRINHO DO LOCALSTORAGE
function loadCart() {
    const storedCart = localStorage.getItem('cart');
    if (storedCart) {
        return JSON.parse(storedCart);
    }else {
        return[];
    }
}

// Função para exibir os items no  carrinho na página
function displayCartItems(){
    const cartItemsContainer = document.getElementById('cartItems');
    const emptyCartMessage = document.getElementById('emptyCartMessage');

    // Carregar os itens 
    const cart = loadCart();

    // Verificar se o carrinho está vazio
    if (cart.length === 0) {
        emptyCartMessage.textContent = "Seu carrinho está vazio.";
        cartItemsContainer.innerHTML = ''; // limpar itens exibidos
        return;
    }

    // Limpar a mensagem de carrinho vazio
    emptyCartMessage.textContent = '';

    // criar elementos para cada item no carrinho
    cartItemsContainer.innerHTML = ''; // Limpar o container antes de adicionar novos itens 
    cart.forEach((item,index)  => {
        const cartItemDiv = document.createElement('div');
        cartItemDiv.classList.add('cart-item');

        // Informações da caneca 
        const itemInfo = document.createElement('div')
        itemInfo.classList.add('cart-item-info');
        itemInfo.innerHTML = `
        <strong> ${item.name} </strong><br>
        Preço: R$ ${parseFloat(item.price).toFixed(2)}<br>
        Modelo: <img src="${item.image}" alt="Imagem da Caneca" style="max-width: 100px; height: auto;"><br>
        `;

        // Botão remover
        const removeButton = document.createElement('button');
        removeButton.classList.add('btn', 'btn-danger','removeBtn');
        removeButton.textContent = 'Remover';
        removeButton.onclick = () => {
            removeFromCart(index);
        };
        //ADICIONAR AS INFORMAÇÕES E O BOTÃO NO CONTAINER
        cartItemDiv.appendChild(itemInfo);
        cartItemDiv.appendChild(removeButton);

        //Adcioonar o item ao container de itens do carrinho
        cartItemsContainer.appendChild(cartItemDiv);


    });

    
}

// Funçaõ para remover item do carrinho
function removeFromCart(index){
    const cart = loadCart();
    cart.splice(index, 1); // remove o item pelo índice
    localStorage.setItem('cart', JSON.stringify(cart)); // atualiza o carrinho no localStorage
    displayCartItems();
}

// chamar a função para exibir os itens quando a pagina carregar
document.addEventListener('DOMContentLoaded', displayCartItems);