const { DataTypes } = require('sequelize');
const sequelize = require('../conection/connection');
require('dotenv').config();
const CatalogoView = sequelize.define('v_datos_completos', {
    catalogo_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
    },
    poster: {
        type: DataTypes.STRING,
        allowNull: false,
        get() {
            const baseUrl = process.env.MEDIA_BASE_URL;
            const posterPath = this.getDataValue('poster');
            return `${baseUrl}${posterPath}`;
        },
    },
    titulo: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    categoria_nombre: {
        type: DataTypes.STRING,
    },
    resumen: {
        type: DataTypes.STRING,
    },
    temporadas: {
        type: DataTypes.INTEGER,
        allowNull: true,
        get() {
            if (!this.getDataValue('temporadas')) return 'Pelicula';
            return this.getDataValue('temporadas');
        },
    },
    trailer: {
        type: DataTypes.STRING,
        get() {
            if (!this.getDataValue('trailer')) return 'N/A';
            return this.getDataValue('trailer');
        },
    },
    generos: {
        type: DataTypes.STRING,
    },
    actores: {
        type: DataTypes.STRING,
    }
}, {
    tableName: 'v_datos_completos',
    timestamps: false,
    freezeTableName: true  // Esto es importante para asegurarse de que sequelize no pluralice el nombre
});

module.exports = CatalogoView;