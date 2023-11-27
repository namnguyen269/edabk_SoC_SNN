DDRPHY
======

Register Listing for DDRPHY
---------------------------

+----------------------------------------------------------------+------------------------------------------------+
| Register                                                       | Address                                        |
+================================================================+================================================+
| :ref:`DDRPHY_RST <DDRPHY_RST>`                                 | :ref:`0xf0002000 <DDRPHY_RST>`                 |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_DLY_SEL <DDRPHY_DLY_SEL>`                         | :ref:`0xf0002004 <DDRPHY_DLY_SEL>`             |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_HALF_SYS8X_TAPS <DDRPHY_HALF_SYS8X_TAPS>`         | :ref:`0xf0002008 <DDRPHY_HALF_SYS8X_TAPS>`     |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WLEVEL_EN <DDRPHY_WLEVEL_EN>`                     | :ref:`0xf000200c <DDRPHY_WLEVEL_EN>`           |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WLEVEL_STROBE <DDRPHY_WLEVEL_STROBE>`             | :ref:`0xf0002010 <DDRPHY_WLEVEL_STROBE>`       |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_CDLY_RST <DDRPHY_CDLY_RST>`                       | :ref:`0xf0002014 <DDRPHY_CDLY_RST>`            |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_CDLY_INC <DDRPHY_CDLY_INC>`                       | :ref:`0xf0002018 <DDRPHY_CDLY_INC>`            |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_RDLY_DQ_RST <DDRPHY_RDLY_DQ_RST>`                 | :ref:`0xf000201c <DDRPHY_RDLY_DQ_RST>`         |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_RDLY_DQ_INC <DDRPHY_RDLY_DQ_INC>`                 | :ref:`0xf0002020 <DDRPHY_RDLY_DQ_INC>`         |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_RDLY_DQ_BITSLIP_RST <DDRPHY_RDLY_DQ_BITSLIP_RST>` | :ref:`0xf0002024 <DDRPHY_RDLY_DQ_BITSLIP_RST>` |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_RDLY_DQ_BITSLIP <DDRPHY_RDLY_DQ_BITSLIP>`         | :ref:`0xf0002028 <DDRPHY_RDLY_DQ_BITSLIP>`     |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WDLY_DQ_RST <DDRPHY_WDLY_DQ_RST>`                 | :ref:`0xf000202c <DDRPHY_WDLY_DQ_RST>`         |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WDLY_DQ_INC <DDRPHY_WDLY_DQ_INC>`                 | :ref:`0xf0002030 <DDRPHY_WDLY_DQ_INC>`         |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WDLY_DQS_RST <DDRPHY_WDLY_DQS_RST>`               | :ref:`0xf0002034 <DDRPHY_WDLY_DQS_RST>`        |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WDLY_DQS_INC <DDRPHY_WDLY_DQS_INC>`               | :ref:`0xf0002038 <DDRPHY_WDLY_DQS_INC>`        |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WDLY_DQ_BITSLIP_RST <DDRPHY_WDLY_DQ_BITSLIP_RST>` | :ref:`0xf000203c <DDRPHY_WDLY_DQ_BITSLIP_RST>` |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WDLY_DQ_BITSLIP <DDRPHY_WDLY_DQ_BITSLIP>`         | :ref:`0xf0002040 <DDRPHY_WDLY_DQ_BITSLIP>`     |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_RDPHASE <DDRPHY_RDPHASE>`                         | :ref:`0xf0002044 <DDRPHY_RDPHASE>`             |
+----------------------------------------------------------------+------------------------------------------------+
| :ref:`DDRPHY_WRPHASE <DDRPHY_WRPHASE>`                         | :ref:`0xf0002048 <DDRPHY_WRPHASE>`             |
+----------------------------------------------------------------+------------------------------------------------+

DDRPHY_RST
^^^^^^^^^^

`Address: 0xf0002000 + 0x0 = 0xf0002000`


    .. wavedrom::
        :caption: DDRPHY_RST

        {
            "reg": [
                {"name": "rst", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_DLY_SEL
^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x4 = 0xf0002004`


    .. wavedrom::
        :caption: DDRPHY_DLY_SEL

        {
            "reg": [
                {"name": "dly_sel[7:0]", "bits": 8},
                {"bits": 24},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


DDRPHY_HALF_SYS8X_TAPS
^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x8 = 0xf0002008`


    .. wavedrom::
        :caption: DDRPHY_HALF_SYS8X_TAPS

        {
            "reg": [
                {"name": "half_sys8x_taps[4:0]", "attr": 'reset: 6', "bits": 5},
                {"bits": 27},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WLEVEL_EN
^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0xc = 0xf000200c`


    .. wavedrom::
        :caption: DDRPHY_WLEVEL_EN

        {
            "reg": [
                {"name": "wlevel_en", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WLEVEL_STROBE
^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x10 = 0xf0002010`


    .. wavedrom::
        :caption: DDRPHY_WLEVEL_STROBE

        {
            "reg": [
                {"name": "wlevel_strobe", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_CDLY_RST
^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x14 = 0xf0002014`


    .. wavedrom::
        :caption: DDRPHY_CDLY_RST

        {
            "reg": [
                {"name": "cdly_rst", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_CDLY_INC
^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x18 = 0xf0002018`


    .. wavedrom::
        :caption: DDRPHY_CDLY_INC

        {
            "reg": [
                {"name": "cdly_inc", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_RDLY_DQ_RST
^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x1c = 0xf000201c`


    .. wavedrom::
        :caption: DDRPHY_RDLY_DQ_RST

        {
            "reg": [
                {"name": "rdly_dq_rst", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_RDLY_DQ_INC
^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x20 = 0xf0002020`


    .. wavedrom::
        :caption: DDRPHY_RDLY_DQ_INC

        {
            "reg": [
                {"name": "rdly_dq_inc", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_RDLY_DQ_BITSLIP_RST
^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x24 = 0xf0002024`


    .. wavedrom::
        :caption: DDRPHY_RDLY_DQ_BITSLIP_RST

        {
            "reg": [
                {"name": "rdly_dq_bitslip_rst", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_RDLY_DQ_BITSLIP
^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x28 = 0xf0002028`


    .. wavedrom::
        :caption: DDRPHY_RDLY_DQ_BITSLIP

        {
            "reg": [
                {"name": "rdly_dq_bitslip", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WDLY_DQ_RST
^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x2c = 0xf000202c`


    .. wavedrom::
        :caption: DDRPHY_WDLY_DQ_RST

        {
            "reg": [
                {"name": "wdly_dq_rst", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WDLY_DQ_INC
^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x30 = 0xf0002030`


    .. wavedrom::
        :caption: DDRPHY_WDLY_DQ_INC

        {
            "reg": [
                {"name": "wdly_dq_inc", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WDLY_DQS_RST
^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x34 = 0xf0002034`


    .. wavedrom::
        :caption: DDRPHY_WDLY_DQS_RST

        {
            "reg": [
                {"name": "wdly_dqs_rst", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WDLY_DQS_INC
^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x38 = 0xf0002038`


    .. wavedrom::
        :caption: DDRPHY_WDLY_DQS_INC

        {
            "reg": [
                {"name": "wdly_dqs_inc", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WDLY_DQ_BITSLIP_RST
^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x3c = 0xf000203c`


    .. wavedrom::
        :caption: DDRPHY_WDLY_DQ_BITSLIP_RST

        {
            "reg": [
                {"name": "wdly_dq_bitslip_rst", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WDLY_DQ_BITSLIP
^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x40 = 0xf0002040`


    .. wavedrom::
        :caption: DDRPHY_WDLY_DQ_BITSLIP

        {
            "reg": [
                {"name": "wdly_dq_bitslip", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_RDPHASE
^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x44 = 0xf0002044`


    .. wavedrom::
        :caption: DDRPHY_RDPHASE

        {
            "reg": [
                {"name": "rdphase[1:0]", "attr": 'reset: 1', "bits": 2},
                {"bits": 30},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


DDRPHY_WRPHASE
^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x48 = 0xf0002048`


    .. wavedrom::
        :caption: DDRPHY_WRPHASE

        {
            "reg": [
                {"name": "wrphase[1:0]", "attr": 'reset: 2', "bits": 2},
                {"bits": 30},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


