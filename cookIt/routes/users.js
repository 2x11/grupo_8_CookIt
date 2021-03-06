//MODULOS REQUERIDOS
const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const avatarMulter = require('../middlewares/avatarMulter');

const registerValidator = require('../validations/registerValidator'); //validaciones para el registro de usuarios
const loginValidator = require('../validations/loginValidator'); //validaciones para loguearse

//RUTAS


router.get('/login', usersController.login);

router.get('/logout', usersController.logout); //creo un metodo que cierre session

router.get('/registro', usersController.registro);

//router.post('/registro', avatarMulter.any(), registerValidator, usersController.guardar); //metodo JSON
router.post('/registro', avatarMulter.any(), registerValidator, usersController.save); //metodo SQL

router.post('/login', loginValidator, usersController.loginInit); //creo un metodo que reciba y valide los datos para loguearse por SQL

router.get('/perfil/:id', usersController.perfilUsuario);



module.exports = router;