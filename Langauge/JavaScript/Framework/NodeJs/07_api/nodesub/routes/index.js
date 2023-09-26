const router = require('express').Router();
const { test } = require('../controllers');


router.get('/test', test);

module.exports = router;