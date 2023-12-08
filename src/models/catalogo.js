const { DataTypes } = require('sequelize');
const sequelize = require('../conection/connection');
require('dotenv').config();
const Catalogo = sequelize.define('catalogo', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
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
      default: 0,
    },
    categoria: {
      type: DataTypes.INTEGER,
      allowNull: false,
      default: false,
    },  
    resumen: {
      type: DataTypes.STRING,
      default: false,
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
        default: false,
        get() {
            if (!this.getDataValue('trailer')) return 'N/A';
            return this.getDataValue('trailer');
        },
      }
}, {
    tableName: 'catalogo',
    timestamps: false,
  });

module.exports = Catalogo;
