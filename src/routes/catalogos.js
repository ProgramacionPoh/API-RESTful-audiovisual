const express = require("express");
const router = express.Router();
const Catalogo = require("../models/catalogo")
const CatalogoView = require("../models/vistas")
const dotenv = require('dotenv');
const { Op } = require('sequelize')
require('dotenv').config();
dotenv.config();


router.get("/catalogo", async (req, res) => {
    try {
        const catalogo = await CatalogoView.findAll({
            attributes: [
                'catalogo_id',
                'poster',
                'titulo',
                'categoria_nombre',
                'resumen',
                'temporadas',
                'trailer',
                'generos',
                'actores'
            ]
        });

        if (catalogo.length === 0) {
            return res.status(404).json({ message: "No se encontraron elementos en el catálogo" });
        }

        res.status(200).json(catalogo);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al recuperar el catálogo" });
    }
});

router.get("/catalogo/:id", async (req, res) => {
    const id = req.params.id;

    // Verificar si el id es válido
    if (!id || isNaN(id)) {
        return res.status(400).json({ message: "ID inválido" });
    }

    try {
        const catalogo = await Catalogo.findByPk(id, {
            attributes: [
                'id',
                'poster',
                'titulo',
                'categoria',
                'resumen',
                'temporadas',
                'trailer'
            ]
        });

        if (!catalogo) {
            return res.status(404).json({ message: `No se encontró un catálogo con el ID: ${id}` });
        }

        res.status(200).json(catalogo);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al recuperar el catálogo por ID" });
    }
});


router.get('/catalogo/nombre/:nombre', async (req, res) => {
    const nombre = req.params.nombre;

    // Verificar si el nombre es válido
    if (!nombre || nombre.trim() === "") {
        return res.status(400).json({ message: "Nombre inválido o vacío" });
    }

    try {
        const catalogo_nombre = await Catalogo.findAll({
            where: {
                titulo: {
                    [Op.substring]: nombre
                }
            }
        });

        if (!catalogo_nombre.length) {
            return res.status(404).json({ message: `No se hallaron resultados para Título: ${nombre}` });
        }

        res.status(200).json(catalogo_nombre);
        
    } catch (error) {
        console.error(error);
        res.status(500).json({ status: 500, message: "Error al recuperar el catálogo por nombre" });
    }
});

router.get("/catalogo/genero/:genero", async (req, res) => {
    const genero = req.params.genero;
    if (!genero || genero.trim() === "") {
        return res.status(400).json({ message: "Nombre de género inválido o vacío" });
    }

    try {
        const generos = await CatalogoView.findAll({
            where: {
                generos: {
                    [Op.like]: `%${genero}%`
                }
            },
            attributes: [
                'catalogo_id',
                'generos'
            ]
        });

        if (generos.length === 0) {
            return res.status(404).json({ message: `No se encontraron registros para el género: ${genero}` });
        }

        res.status(200).json(generos);

    } catch (error) {
        console.error("Error al obtener los géneros por nombre:", error);
        res.status(500).json({ message: "Error interno del servidor al recuperar el catálogo por género" });
    }
});

router.get('/catalogo/categoria/:categoria', async (req, res) => {
    const categoriaNombre = req.params.categoria;

    if (!categoriaNombre || categoriaNombre.trim() === "") {
        return res.status(400).json({ message: "Nombre de categoría inválido o vacío" });
    }

    try {
        const categoria = await CatalogoView.findAll({
            where: {
                categoria_nombre: { [Op.substring]: categoriaNombre }
            }
        });

        if (!categoria.length) {
            return res.status(404).json({ message: `No se hallaron resultados para Categoría: ${categoriaNombre}` });
        }

        res.status(200).json(categoria);

    } catch (error) {
        console.error("Error al obtener la categoría:", error);
        res.status(500).json({ message: "Error interno del servidor al recuperar la categoría" });
    }
});

module.exports = router;