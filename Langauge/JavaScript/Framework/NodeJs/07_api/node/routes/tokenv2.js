const router = require('express').Router();
const { verifyToken, apiLimiter } = require('../middlewares');
const { tokenTest, createToken} = require('../controllers/token');

router.post('/token', apiLimiter, createToken);
router.get('/test', apiLimiter, verifyToken, tokenTest);

module.exports = router;