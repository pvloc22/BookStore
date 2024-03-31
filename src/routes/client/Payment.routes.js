const { Router } = require('express');
const express = require('express');
const router = express.Router();

const  paymentControllers = require('../../app/controllers/client/PaymentControllers')

router.get('/:token', paymentControllers.PaymentGet)
router.post('/addToCash', paymentControllers.insertBookToCart)
router.post('/removeToCash', paymentControllers.removeBookToCart)
router.post('/payToCash', paymentControllers.paymentBookToCart)
router.post('/checkpassword', paymentControllers.checkPassword)
module.exports = router