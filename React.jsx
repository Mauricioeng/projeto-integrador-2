import React, {useState} from 'react';

function CustonCup(){
    const [color, serColor] = useState ('#ffffff');
    const [text,setText] = useState('');
    const [image, setImage] = useState(null);

    const handleColorChange = (e) => {
        serColor(e.target.value);
    };

    const handleTextChange = (e) => {
        setText(e.target.value);

    };

    const handleImageUpload = (e) => {
        const file =  e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = (upload) => {
                setImage(upload.target.result);
            };
            reader.readAsDataURL(file);

        }
    };
return (
<div className='custom-cup'>
    <h2>Personalize sua  Xícara </h2>
    <div className='options'>
        <label>
            Escolha a cor:
            <input type='color' value={color} onChange={handleColorChange} />
        </label>
        <label>
            Texto pesonalizado:
            <input type='text' value={text} onChange={handleTextChange} placeholder='Adicione um texto' />

        </label>
        <label>
            Imagem personalizada:
            <input type='file' onChange={handleImageUpload} />
        </label>

    </div>
    <div className='preview' style={{backgroudColor:color, width: '200px', height: ' 200px', position: 'relative'}}>
        {image && <img src='{image}' alt='imagem' style={{width:'100%', height:'auto'}} />}
        <p style={{ textAlign: 'center', color: '#000'}}> {text}</p>
        </div>
</div>
);

}

export default CustonCup;