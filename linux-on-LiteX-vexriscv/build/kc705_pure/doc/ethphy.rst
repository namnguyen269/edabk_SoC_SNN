ETHPHY
======

Register Listing for ETHPHY
---------------------------

+----------------------------------------------------------------+------------------------------------------------+
| Register                                                       | Address                                        |
+================================================================+================================================+
| :ref:`ETHPHY_MODE_DETECTION_MODE <ETHPHY_MODE_DETECTION_MODE>` | :ref:`0xf0002800 <ETHPHY_MODE_DETECTION_MODE>` |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`ETHPHY_CRG_RESET <ETHPHY_CRG_RESET>`                     | :ref:`0xf0002804 <ETHPHY_CRG_RESET>`           |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`ETHPHY_MDIO_W <ETHPHY_MDIO_W>`                           | :ref:`0xf0002808 <ETHPHY_MDIO_W>`              |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`ETHPHY_MDIO_R <ETHPHY_MDIO_R>`                           | :ref:`0xf000280c <ETHPHY_MDIO_R>`              |
+----------------------------------------------------------------+------------------------------------------------+

ETHPHY_MODE_DETECTION_MODE
^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002800 + 0x0 = 0xf0002800`


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

`Address: 0xf0002800 + 0x4 = 0xf0002804`


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

`Address: 0xf0002800 + 0x8 = 0xf0002808`


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

`Address: 0xf0002800 + 0xc = 0xf000280c`


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

