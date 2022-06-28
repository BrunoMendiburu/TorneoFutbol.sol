// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract LigaFutbol {
    mapping(string => string) jugadores__equipo;
    mapping(string => uint256) puntos__equipo;
    string[] private _jugadores;
        uint256[] private _puntos;
}

function addEquipo(string memory _equipo) public {
    jugadores__equipo[_equipo] = "";
    puntos__equipo[_equipo] = 0;
}

function deleteEquipo(string memory _equipo) public {
    delete jugadores__equipo[_equipo];
    delete puntos__equipo[_equipo];
}

function deleteJugador(string memory _jugador) public {
    delete jugadores__equipo[_jugador];
}

function addJugador (string memory _equipo, string memory _jugador) public {
    jugadores__equipo[_equipo] = _jugador; 
}

function addPuntos (
    string memory _1equipo,
    string memory _2equipo,
) public {
    if (jugadores__equipo[_1equipo] == jugadores__equipo[_2equipo]) {
        puntos__equipo[_1equipo] += 1;
        puntos__equipo[_2equipo] += 1;
    } else if {
        puntos__equipo[_1equipo] += 3;
        puntos__equipo[_2equipo] += 0;
    }
    else {
        puntos__equipo[_1equipo] += 0;
        puntos__equipo[_2equipo] += 3;
    }
}


function get_puntos_equipo(string memory equipo_)
        public view
        returns (uint256)
    {
        return puntos_equipo[equipo_];
    }

function getJugadores(string memory _equipo) public view returns (string[]) {
    return jugadores__equipo[_equipo];
}

