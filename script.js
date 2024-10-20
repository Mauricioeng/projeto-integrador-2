

// Seletores do dom

const canvas = document.querySelector('#cupCanvas');
const colorPicker = document.getElementById('colorPicker');
const uploadImage = document.getElementById('uploadImage');






// configuração da cena, camera e renderizador
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(50, canvas.clientWidth / canvas.clientHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer({canvas: canvas, alpha: true}); // fundo transparente
renderer.setSize(1000,1000);
renderer.setPixelRatio(window.devicePixelRatio);



//Orbitcontrols para permitir rotação manual
const controls = new THREE.OrbitControls(camera,renderer.domElement);
controls.enableDamping = true;
controls.dampingFactor = 0.05;
controls.rotateSpeed = 0.5;


//////////////// luzes para realismo ///////////////////////

const ambientLight = new THREE.AmbientLight(0xffffff, 0.5); // ajustar a intensidade
scene.add(ambientLight);

const directionalLight = new THREE.DirectionalLight(0xffffff, 0.6);
directionalLight.position.set(5,10, 7.5);
scene.add(directionalLight);

// Grupo caneca
const cupGroup = new THREE.Group();

// Pate externa da caneca
const outerCupGeometry = new THREE.CylinderGeometry(3.5, 3.5, 6, 250); /// definição do cilindro
const outerCupMaterial = new THREE.MeshStandardMaterial({color: 0xffffff, roughness: 0.2, metalness: 0.1});
const outerCup = new THREE.Mesh(outerCupGeometry,outerCupMaterial);
outerCup.position.y = 3;
cupGroup.add(outerCup);

// parte interna da caneca
const innerCupGeometry = new THREE.CylinderGeometry(3.3, 3.3, 4, 64);
const innerCupMaterial = new THREE.MeshStandardMaterial({
    roughness:0.2,
    metalness:0.6,
    side: THREE.DoubleSide // permite ver o interior ??? precisa de ajustes gostaria de colocar café dentro

});
const innerCup = new THREE.Mesh(innerCupGeometry, innerCupMaterial);
innerCup.position.y = 4.1; // café
cupGroup.add(innerCup);

// fundo da caneca
const bottomCupGeometry = new THREE.CylinderGeometry(3.3, 3.3, 0.5, 100);
const bottomCupMaterial = new THREE.MeshStandardMaterial({color: 0xffffff});
const bottomCup = new THREE.Mesh(bottomCupGeometry,bottomCupMaterial);
bottomCup.position.y = 3;
cupGroup.add(bottomCup);

// Base da caneca
const baseGeometry = new THREE.CylinderGeometry(3.5, 3.5, 0.001, 64);
const baseMaterial = new THREE.MeshStandardMaterial({color: 0xffffff}); // material com cor solida
const base = new THREE.Mesh(baseGeometry,baseMaterial);
base.position.y = 3;
cupGroup.add(base);

// borda superior da caneca
const rimGeometry = new THREE.TorusGeometry(3.5, 0.2, 5, 800);
const rimMaterial = new THREE.MeshStandardMaterial({color: 0xffffff, roughness: 0.2, metalness: 0.1});
const rim = new THREE.Mesh(rimGeometry, rimMaterial);
rim.position.y = 6;
rim.rotation.x = Math.PI / 2;
cupGroup.add(rim);

// alça para caneca
const handleGeometry = new THREE. TorusGeometry(1.5, 0.3, 16, 100);
const handleMaterial = new THREE.MeshStandardMaterial({color: 0xffffff, roughness: 0.2, metalness:0.1});
const handle = new THREE.Mesh(handleGeometry, handleMaterial);
handle.position.set(4.5,3,0);
handle.rotation.z = Math.PI / 2 ;
cupGroup.add(handle);

scene.add(cupGroup);

// variavel para indicar giro continuo
let isSpinning  = false; // Controle giro continuo
let isColorChanging = false; // controle da mudança de cor automatica
let colorChangeInterval; // intervalo para mudança de cor

// aplicar textura apenas nas laterais
uploadImage.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file){
        const reader = new FileReader();
        reader.onload = function (e){
            const textureLoader = new THREE.TextureLoader();
            const texture = textureLoader.load(URL.createObjectURL(file));
            outerCupMaterial.map = texture; // Aplica apenas as laterais
            outerCupMaterial.map.wrapS = THREE.RepeatWrapping; // repetir horizontalmente
            outerCupMaterial.map.wrapT = THREE.RepeatWrapping;
            outerCupMaterial.map.repeat.set(2,1); // ajuste repetição
            texture.offset.set(0.25,0.25);
            outerCupMaterial.needsUpdate = true;
            texture.repeat.set(1,1);

        };
        reader.readAsDataURL(file);
    }
});

// Atualiza cor
colorPicker.addEventListener('input',(event) => {
    const color = event.target.value;
    outerCupMaterial.color.set(color);
    handleMaterial.color.set(color);
    rimMaterial.color.set(color);
    outerCupMaterial.needsUpdate = true;
    rimMaterial.needsUpdate = true;

 

});

// Posição da câmera   
camera.position.set(10, 6, 12);
camera.lookAt(cupGroup.position);


// Animação 
function animate(){
    requestAnimationFrame(animate);
    controls.update();

    // Se isSpinning estiver true, faz a rotação continua
    if(isSpinning){
        cupGroup.rotation.y += 0.01; // define a velocidade do giro 
    }
    renderer.render(scene,camera);

}
animate();

// função para ajustar tamanho do canvas ao redimensionar
function resizeCanvas(){
    const width = window.innerWidth;
    const height = window.innerHeight;
    renderer.setSize(width,height);
    camera.aspect = width / height;
    camera.updateProjectionMatrix();

}
resizeCanvas();
window.addEventListener('resize', resizeCanvas);

// lista de cores predefinidas
const predefinedColors = [
    0xff0000, // vermelho
    0x0000ff, // azul
    0x00ff00, // verde 
    0x000000, // preto
    0xffffff, // branco
    0xffff00, // amarelo
    0xffc0cb, // rosa
    0x800080, // roxo

];

// Função para mudar a cor
function changeColor(){
    if(isColorChanging){
        const randomIndex = Math.floor(Math.random() * predefinedColors.length);
        const randomColor = predefinedColors[randomIndex];
        outerCupMaterial.color.set(randomColor);
        handleMaterial.color.set(randomColor);
        rimMaterial.color.set(randomColor);
        outerCupMaterial.needsUpdate = true;
        rimMaterial.needsUpdate = true;

    }
}


// controle por voz usando WEB SPEECH API
if ('webkitSpeechRecognition'in window || 'SpeechRecognition' in window) {
    const SpeechRecognition = window.SpeechRecognition ||window.webkitSpeechRecognition;
    const recognition = new SpeechRecognition();

    recognition.lang = 'pt-BR'; // definição do idioma br
    recognition.interimResults = false;
    recognition.continuous = true; // Para continuar ouvindo após o comando

    recognition.onresult = function (event){
        const lastResult = event.results[event.results.length - 1] [0] . transcript.toLowerCase();

        console.log("Comando de voz reconhecido: ", lastResult);

        

        if (lastResult.includes("girar")){
            isSpinning = true; // ativa giro continuo
          

        }
        if (lastResult.includes("parar")){
            isSpinning = false; // para o giro continuo
            isColorChanging = false; // para a mudança de cor
            clearInterval(colorChangeInterval); // limpa o intervalo  mudança de  cor
        }
        if (lastResult.includes("aproximar")){
            camera.position.z -= 3;  // aproxima a câmera
        }
        if (lastResult.includes("afastar")){ 
            camera.position.z += 3; // afasta a câmera
        }
        if (lastResult.includes("mudar cor")){
            isColorChanging = true; // ativa a mudança de cor
            changeColor(); // muda a cor imeditamente
            colorChangeInterval = setInterval(changeColor, 1600); // muda a cor
        
    }   
    // olhar para cima
    if(lastResult.includes("olhar para cima")){
        camera.position.y += 5; // move a câmera para cima
    }
    // Olhar para baixo
    if (lastResult.includes("olhar para baixo")){
        camera.position.y -= 5; // move a camera para baixo
    }
    
    
};

recognition.onerror = function(event){
    console.error("Erro no reconhecimento de voz:", event.error);
};

recognition.start(); // iniciar o reconhecimento de voz
        

}else{
    console.warn("API de reconhecimento de voz não suportada neste navegador.");
}






