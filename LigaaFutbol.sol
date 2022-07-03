// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract LigaFutbol {
    mapping(string => string) jugadores__equipo;
    mapping(string => uint256) puntos__equipo;
    string[] private _jugadores;
    uint256[] private _puntos;

    function addJugadoresEquipo(string memory _equipo, string memory _jugador)
        public
    {
        jugadores__equipo[_equipo] = _jugador;
    }

    function deleteJugadoresEquipo(string memory _jugador) public view {
        for (uint256 i = 0; i < _jugadores.length; i++) {
            if (
                keccak256(abi.encodePacked(_jugadores[i])) ==
                keccak256(abi.encodePacked(_jugador))
            ) {
                delete _jugador;
            }
        }
    }

    function addPuntosEquipo(
        string memory _1equipo,
        string memory _2equipo,
        uint256 goals_1,
        uint256 goals_2
    ) public {
        if (goals_1 == goals_2) {
            puntos__equipo[_1equipo] += 1;
            puntos__equipo[_2equipo] += 1;
        } else if (goals_1 > goals_2) {
            puntos__equipo[_1equipo] += 3;
            puntos__equipo[_2equipo] += 0;
        } else {
            puntos__equipo[_1equipo] += 0;
            puntos__equipo[_2equipo] += 3;
        }
    }

    function getPuntosEquipo(string memory equipo__)
        public
        view
        returns (uint256)
    {
        uint256 puntos = 0;
        for (uint256 i = 0; i < _puntos.length; i++) {
            puntos += _puntos[i]; // decirle a chona
        }
        return puntos;
    }

    function getJugadoresEquipo() public view returns (string[] memory) {
        string[] memory jugadores = new string[](_jugadores.length);
        for (uint256 i = 0; i < jugadores.length; i++) {
            jugadores[i] = jugadores[i];
        }
        return jugadores;
    }

    function getEquipoMasPuntos() public view returns (string memory) {
        uint256 puntos_max = 0;
        string memory equipo;
        string memory equipo_mas_puntos = "";
        for (uint256 i = 0; i < _puntos.length; i++) {
            if (getPuntosEquipo(equipo) > puntos_max) {
                puntos_max = getPuntosEquipo(equipo);
                equipo_mas_puntos = equipo;
            }
        }
        return equipo_mas_puntos;
    }
}
