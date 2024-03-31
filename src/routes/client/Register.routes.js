const express = require('express');
const router = express.Router();
const registerControllers = require('../../app/controllers/client/RegisterControllers');

router.post('/', registerControllers.RegisterPost)
router.get('/', registerControllers.RegisterGet)

module.exports = router