ETHPHY
======

Register Listing for ETHPHY
---------------------------

+----------------------------------------------------------------+------------------------------------------------+
| Register                                                       | Address                                        |
+================================================================+================================================+
| :ref:`ETHPHY_MODE_DETECTION_MODE <ETHPHY_MODE_DETECTION_MODE>` | :ref:`0xf0003000 <ETHPHY_MODE_DETECTION_MODE>` |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`ETHPHY_CRG_RESET <ETHPHY_CRG_RESET>`                     | :ref:`0xf0003004 <ETHPHY_CRG_RESET>`           |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`ETHPHY_MDIO_W <ETHPHY_MDIO_W>`                           | :ref:`0xf0003008 <ETHPHY_MDIO_W>`              |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`ETHPHY_MDIO_R <ETHPHY_MDIO_R>`                           | :ref:`0xf000300c <ETHPHY_MDIO_R>`              |
+----------------------------------------------------------------+------------------------------------------------+

ETHPHY_MODE_DETECTION_MODE
^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0003000 + 0x0 = 0xf0003000`


    .. wavedrom::
        :caption: ETHPHY_MODE_DETECTION_MODE

        {
            "reg": [
                {"name": "mode_detection_mode", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


ETHPHY_CRG_RESET
^^^^^^^^^^^^^^^^

`Address: 0xf0003000 + 0x4 = 0xf0003004`


    .. wavedrom::
        :caption: ETHPHY_CRG_RESET

        {
            "reg": [
                {"name": "crg_reset", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


ETHPHY_MDIO_W
^^^^^^^^^^^^^

`Address: 0xf0003000 + 0x8 = 0xf0003008`


    .. wavedrom::
        :caption: ETHPHY_MDIO_W

        {
            "reg": [
                {"name": "mdc",  "bits": 1},
                {"name": "oe",  "bits": 1},
                {"name": "w",  "bits": 1},
                {"bits": 29}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


+-------+------+-------------+
| Field | Name | Description |
+=======+======+=============+
+-------+------+-------------+
+-------+------+-------------+
+-------+------+-------------+

ETHPHY_MDIO_R
^^^^^^^^^^^^^

`Address: 0xf0003000 + 0xc = 0xf000300c`


    .. wavedrom::
        :caption: ETHPHY_MDIO_R

        {
            "reg": [
                {"name": "r",  "bits": 1},
                {"bits": 31}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


+-------+------+-------------+
| Field | Name | Description |
+=======+======+=============+
+-------+------+-------------+

