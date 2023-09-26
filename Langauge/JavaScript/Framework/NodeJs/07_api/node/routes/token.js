const router = require('express').Router();
const { verifyToken, deprecate } = require('../middlewares');
const { tokenTest, createToken} = require('../controllers/token');

router.use(deprecate)

router.post('/token', createToken);
router.get('/test', verifyToken, tokenTest);

module.exports = router;