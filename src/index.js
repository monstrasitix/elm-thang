// Essentials
import './style/main';
import './js/main';


// Elm
import { Elm } from './elm/Main';



if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('./service-worker.js')
        .then(console.log)
        .catch(console.error);
}



const target = document.getElementById('root');


const app = Elm.Main.init({
    node: target,
    flags: {
        
    },
});