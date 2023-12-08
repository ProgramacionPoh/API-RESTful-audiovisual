const express = require("express");
const router = express.Router();
const dotenv = require('dotenv');
dotenv.config();
const CatalogoView = require("../models/vistas")


router.get("/categorias", async (req, res) => {
    try {
        const categorias = await CatalogoView.findAll({
            attributes: ['categoria_nombre'], // Solo seleccionamos la columna de categorías.
            group: ['categoria_nombre'],      // Agrupamos por nombre de categoría para evitar repetidos.
        });

        if (categorias.length === 0) {
            return res.status(404).json({ message: "No se encontraron categorías" });
        }

        // Si quieres devolver un array simple en lugar de un array de objetos:
        const categoriasSimples = categorias.map(cat => cat.categoria_nombre);
        res.status(200).json(categoriasSimples);

    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al recuperar las categorías" });
    }
});

module.exports = router;