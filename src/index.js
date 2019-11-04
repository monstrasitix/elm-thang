// Essentials
import './style/main';
import './js/main';


// Elm
import { Elm } from './elm/Main';


const target = document.getElementById('root');


const app = Elm.Main.init({
    node: target,
    flags: {
        
    },
});