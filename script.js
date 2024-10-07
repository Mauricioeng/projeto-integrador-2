// Seletores do Dom
const canvas = document.querySelector('#cupCanvas');
const colorPicker = document.getElementById('colorPicker');
const uploadImage = document.getElementById('uploadImage');







// Configuração da cena, câmera e renderizador
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(50, canvas.clientWidth / canvas.clientHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer({canvas: canvas, alpha: true}); // Fundo transparente
renderer.setSize (1000,1000);
renderer.setPixelRatio(window.devicePixelRatio);

//OrbiControls para permitir rotação manual
const controls = new THREE.OrbitControls(camera, renderer.domElement);
controls.enableDamping = true;
controls.dampingFactor = 0.05;
controls.rotateSpeed = 0.5;

// Luzes para realismo
const ambientLight = new THREE.AmbientLight(0xffffff, 0.5); // Ajustar a intensidade
scene.add(ambientLight);

const directionalLight = new THREE.DirectionalLight(0xffffff, 0.6);
directionalLight.position.set(5, 10, 7.5);
scene.add(directionalLight);

//Grupo caneca
const cupGroup = new THREE.Group();

//Parte externa da caneca
const outerCupGeometry = new THREE.CylinderGeometry(3.5, 3.5, 6, 250); // definição do cilindro
const outerCupMaterial = new THREE.MeshStandardMaterial({ color: 0Xffffff, roughness: 0.2, metalness: 0.1});
const outerCup = new THREE.Mesh(outerCupGeometry, outerCupMaterial);
outerCup.position.y = 3;
cupGroup.add(outerCup);

function animate() {
    requestAnimationFrame(animate);
    controls.update();
    renderer.render(scene, camera);
}
animate();
// Parte interna da caneca
const innerCupGeometry = new THREE.CylinderGeometry(3.3, 3.3, 4, 64);
const innerCupMaterial = new THREE.MeshStandardMaterial({
  
    roughness: 0.2,
    metalness: 0.6,
    side: THREE.DoubleSide // Permite ver o interior
});

const innerCup = new THREE.Mesh(innerCupGeometry, innerCupMaterial);
innerCup.position.y = 4.1; // café
cupGroup.add(innerCup);

//fundo da caneca
const bottomCupGeometry = new THREE.CylinderGeometry(3.3, 3.3, 0.5, 100);
const bottomCupMaterial = new THREE.MeshStandardMaterial({color: 0xffffff});
const bottomCup = new THREE.Mesh(bottomCupGeometry,bottomCupMaterial);
bottomCup.position.y = 3;
cupGroup.add(bottomCup);


//Base da caneca
const baseGeometry = new THREE.CylinderGeometry(3.5, 3.5, 0.001,64);
const baseMaterial = new THREE.MeshStandardMaterial({color: 0xffffff}); // Material com cor sólida
const base = new THREE.Mesh(baseGeometry,baseMaterial);
base.position.y = 3 ;
cupGroup.add (base);

// Borda superior da caneca
const rimGeometry = new THREE.TorusGeometry(3.5, 0.2, 5, 800);
const rimMaterial = new THREE.MeshStandardMaterial({color: 0xffffff, roughness: 0.2, metalness: 0.1}); // cor sólida para a borda
const rim = new THREE.Mesh(rimGeometry,rimMaterial);
rim.position.y = 6;
rim.rotation.x = Math.PI / 2;
cupGroup.add(rim);

// alça para caneca
const handleGeometry = new THREE.TorusGeometry(1.5,0.3,16,100);
const handleMaterial = new THREE.MeshStandardMaterial({color: 0xffffff, roughness: 0.2, metalness: 0.1});
const handle = new THREE.Mesh(handleGeometry,handleMaterial);
handle.position.set(4.5, 3 , 0);
handle.rotation.z = Math.PI / 2;
cupGroup.add(handle);

scene.add(cupGroup);


// Aplicar textura apenas na laterais
uploadImage.addEventListener('change',(event) => {
    const file = event.target.files[0];
    if (file){
        const reader = new FileReader();
        reader.onload = function (e) {
            const textureLoader = new THREE.TextureLoader();
            const texture = textureLoader.load(e.target.result);
            outerCupMaterial.map = texture; // Aplica apenas às laterais
            outerCupMaterial.map.wrapS = THREE.ClampToEdgeWrapping; //repetir hor
            outerCupMaterial.map.wrapT = THREE.ClampToEdgeWrapping;
            texture.offset.set(0.25, 0.25);
            outerCupMaterial.needsUpdate = true;
            
                texture.repeat.set(1,1);
        };

        reader.readAsDataURL(file);
    }
});

// atualiza cor
colorPicker.addEventListener('input', (event) => {
    const color = event.target.value;
    outerCupMaterial.color.set(color);
    handleMaterial.color.set(color);
    rimMaterial.color.set(color);
    outerCupMaterial.needsUpdate = true;
    rimMaterial.needsUpdate = true;
})



// Posição da câmera
camera.position.set(10, 6, 12);
camera.lookAt(cupGroup.position);

// Animação
function animate() {
    requestAnimationFrame(animate);
    controls.update();
    renderer.render(scene, camera);
}

animate();

// atualizar cor da canenca

colorPicker.addEventListener('input',(event) => {
    const color = event.target.value;
    outerCupMaterial.color.set(color);
    outerCupGeometry.needsUpdate = true ;
});

// Carregar textura e aplicá-la á lateral da caneca
 uploadImage.addEventListener('change', (Event) =>{
    const file = event.target.files[0];
    if (file){
        const reader = new FileReader();
        reader.onload = function (e) {
            const textureLoader = new THREE.TextureLoader();
            textureLoader.load(e.target.result, (texture) =>{
                outerCupMaterial.map = texture; //Aplica apenas à lateral
                outerCupMaterial.map.wrapS = THREE.RepeatWrapping; // Permite repetir horizontalmente
                outerCupMaterial.map.wrapT = THREE.RepeatWrapping; // Permite repetição vertical
                outerCupMaterial.needsUpdate = true;
           
                texture.repeat.set(1,1);

            });
        };
        reader.readAsDataURL(file);
    };

    /// canvas celular
function resizeCanvas(){
    const width = window.innerWidth;
    const height = window.innerHeight;


    // dimensões canvas
    renderer.setSize(width,height);
    camera.aspect = width / height;
    camera.updateProjectionMatrix();
}

/// chamar a função 

resizeCanvas();
window.addEventListener('resize', resizeCanvas);


});








