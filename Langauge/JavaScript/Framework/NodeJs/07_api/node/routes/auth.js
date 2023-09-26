const {isLoggedIn, isNotLoggedIn} = require('../middlewares');
const router = require('express').Router();
const { join, login, logout} = require('../controllers/auth');

router.post('/join', isNotLoggedIn, join);
router.post('/login', isNotLoggedIn, login);
router.get('/logout', isLoggedIn, logout);

module.exports = router;