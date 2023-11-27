ETHMAC
======

Register Listing for ETHMAC
---------------------------

+--------------------------------------------------------------------------------+--------------------------------------------------------+
| Register                                                                       | Address                                                |
+================================================================================+========================================================+
| :ref:`ETHMAC_SRAM_WRITER_SLOT <ETHMAC_SRAM_WRITER_SLOT>`                       | :ref:`0xf0002000 <ETHMAC_SRAM_WRITER_SLOT>`            |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_WRITER_LENGTH <ETHMAC_SRAM_WRITER_LENGTH>`                   | :ref:`0xf0002004 <ETHMAC_SRAM_WRITER_LENGTH>`          |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_WRITER_ERRORS <ETHMAC_SRAM_WRITER_ERRORS>`                   | :ref:`0xf0002008 <ETHMAC_SRAM_WRITER_ERRORS>`          |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_WRITER_EV_STATUS <ETHMAC_SRAM_WRITER_EV_STATUS>`             | :ref:`0xf000200c <ETHMAC_SRAM_WRITER_EV_STATUS>`       |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_WRITER_EV_PENDING <ETHMAC_SRAM_WRITER_EV_PENDING>`           | :ref:`0xf0002010 <ETHMAC_SRAM_WRITER_EV_PENDING>`      |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_WRITER_EV_ENABLE <ETHMAC_SRAM_WRITER_EV_ENABLE>`             | :ref:`0xf0002014 <ETHMAC_SRAM_WRITER_EV_ENABLE>`       |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_READER_START <ETHMAC_SRAM_READER_START>`                     | :ref:`0xf0002018 <ETHMAC_SRAM_READER_START>`           |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_READER_READY <ETHMAC_SRAM_READER_READY>`                     | :ref:`0xf000201c <ETHMAC_SRAM_READER_READY>`           |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_READER_LEVEL <ETHMAC_SRAM_READER_LEVEL>`                     | :ref:`0xf0002020 <ETHMAC_SRAM_READER_LEVEL>`           |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_READER_SLOT <ETHMAC_SRAM_READER_SLOT>`                       | :ref:`0xf0002024 <ETHMAC_SRAM_READER_SLOT>`            |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_READER_LENGTH <ETHMAC_SRAM_READER_LENGTH>`                   | :ref:`0xf0002028 <ETHMAC_SRAM_READER_LENGTH>`          |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_READER_EV_STATUS <ETHMAC_SRAM_READER_EV_STATUS>`             | :ref:`0xf000202c <ETHMAC_SRAM_READER_EV_STATUS>`       |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_READER_EV_PENDING <ETHMAC_SRAM_READER_EV_PENDING>`           | :ref:`0xf0002030 <ETHMAC_SRAM_READER_EV_PENDING>`      |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_SRAM_READER_EV_ENABLE <ETHMAC_SRAM_READER_EV_ENABLE>`             | :ref:`0xf0002034 <ETHMAC_SRAM_READER_EV_ENABLE>`       |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_PREAMBLE_CRC <ETHMAC_PREAMBLE_CRC>`                               | :ref:`0xf0002038 <ETHMAC_PREAMBLE_CRC>`                |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_RX_DATAPATH_PREAMBLE_ERRORS <ETHMAC_RX_DATAPATH_PREAMBLE_ERRORS>` | :ref:`0xf000203c <ETHMAC_RX_DATAPATH_PREAMBLE_ERRORS>` |
+--------------------------------------------------------------------------------+--------------------------------------------------------+
| :ref:`ETHMAC_RX_DATAPATH_CRC_ERRORS <ETHMAC_RX_DATAPATH_CRC_ERRORS>`           | :ref:`0xf0002040 <ETHMAC_RX_DATAPATH_CRC_ERRORS>`      |
+--------------------------------------------------------------------------------+--------------------------------------------------------+

ETHMAC_SRAM_WRITER_SLOT
^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x0 = 0xf0002000`


    .. wavedrom::
        :caption: ETHMAC_SRAM_WRITER_SLOT

        {
            "reg": [
                {"name": "sram_writer_slot", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


ETHMAC_SRAM_WRITER_LENGTH
^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x4 = 0xf0002004`


    .. wavedrom::
        :caption: ETHMAC_SRAM_WRITER_LENGTH

        {
            "reg": [
                {"name": "sram_writer_length[10:0]", "bits": 11},
                {"bits": 21},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


ETHMAC_SRAM_WRITER_ERRORS
^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x8 = 0xf0002008`


    .. wavedrom::
        :caption: ETHMAC_SRAM_WRITER_ERRORS

        {
            "reg": [
                {"name": "sram_writer_errors[31:0]", "bits": 32}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


ETHMAC_SRAM_WRITER_EV_STATUS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0xc = 0xf000200c`

    This register contains the current raw level of the available event trigger.
    Writes to this register have no effect.

    .. wavedrom::
        :caption: ETHMAC_SRAM_WRITER_EV_STATUS

        {
            "reg": [
                {"name": "available",  "bits": 1},
                {"bits": 31}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


+-------+-----------+----------------------------------+
| Field | Name      | Description                      |
+=======+===========+==================================+
| [0]   | AVAILABLE | Level of the ``available`` event |
+-------+-----------+----------------------------------+

ETHMAC_SRAM_WRITER_EV_PENDING
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x10 = 0xf0002010`

    When a  available event occurs, the corresponding bit will be set in this
    register.  To clear the Event, set the corresponding bit in this register.

    .. wavedrom::
        :caption: ETHMAC_SRAM_WRITER_EV_PENDING

        {
            "reg": [
                {"name": "available",  "bits": 1},
                {"bits": 31}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


+-------+-----------+---------------------------------------------------------------------------------+
| Field | Name      | Description                                                                     |
+=======+===========+=================================================================================+
| [0]   | AVAILABLE | `1` if a `available` event occurred. This Event is **level triggered** when the |
|       |           | signal is **high**.                                                             |
+-------+-----------+---------------------------------------------------------------------------------+

ETHMAC_SRAM_WRITER_EV_ENABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x14 = 0xf0002014`

    This register enables the corresponding available events.  Write a ``0`` to this
    register to disable individual events.

    .. wavedrom::
        :caption: ETHMAC_SRAM_WRITER_EV_ENABLE

        {
            "reg": [
                {"name": "available",  "bits": 1},
                {"bits": 31}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


+-------+-----------+-------------------------------------------------+
| Field | Name      | Description                                     |
+=======+===========+=================================================+
| [0]   | AVAILABLE | Write a ``1`` to enable the ``available`` Event |
+-------+-----------+-------------------------------------------------+

ETHMAC_SRAM_READER_START
^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x18 = 0xf0002018`


    .. wavedrom::
        :caption: ETHMAC_SRAM_READER_START

        {
            "reg": [
                {"name": "sram_reader_start", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


ETHMAC_SRAM_READER_READY
^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x1c = 0xf000201c`


    .. wavedrom::
        :caption: ETHMAC_SRAM_READER_READY

        {
            "reg": [
                {"name": "sram_reader_ready", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


ETHMAC_SRAM_READER_LEVEL
^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x20 = 0xf0002020`


    .. wavedrom::
        :caption: ETHMAC_SRAM_READER_LEVEL

        {
            "reg": [
                {"name": "sram_reader_level[1:0]", "bits": 2},
                {"bits": 30},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


ETHMAC_SRAM_READER_SLOT
^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x24 = 0xf0002024`


    .. wavedrom::
        :caption: ETHMAC_SRAM_READER_SLOT

        {
            "reg": [
                {"name": "sram_reader_slot", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


ETHMAC_SRAM_READER_LENGTH
^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x28 = 0xf0002028`


    .. wavedrom::
        :caption: ETHMAC_SRAM_READER_LENGTH

        {
            "reg": [
                {"name": "sram_reader_length[10:0]", "bits": 11},
                {"bits": 21},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


ETHMAC_SRAM_READER_EV_STATUS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x2c = 0xf000202c`

    This register contains the current raw level of the event0 event trigger.
    Writes to this register have no effect.

    .. wavedrom::
        :caption: ETHMAC_SRAM_READER_EV_STATUS

        {
            "reg": [
                {"name": "event0",  "bits": 1},
                {"bits": 31}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


+-------+--------+-------------------------------+
| Field | Name   | Description                   |
+=======+========+===============================+
| [0]   | EVENT0 | Level of the ``event0`` event |
+-------+--------+-------------------------------+

ETHMAC_SRAM_READER_EV_PENDING
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x30 = 0xf0002030`

    When a  event0 event occurs, the corresponding bit will be set in this register.
    To clear the Event, set the corresponding bit in this register.

    .. wavedrom::
        :caption: ETHMAC_SRAM_READER_EV_PENDING

        {
            "reg": [
                {"name": "event0",  "bits": 1},
                {"bits": 31}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


+-------+--------+----------------------------------------------------------------------------------+
| Field | Name   | Description                                                                      |
+=======+========+==================================================================================+
| [0]   | EVENT0 | `1` if a this particular event occurred. This Event is triggered on a **rising** |
|       |        | edge.                                                                            |
+-------+--------+----------------------------------------------------------------------------------+

ETHMAC_SRAM_READER_EV_ENABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x34 = 0xf0002034`

    This register enables the corresponding event0 events.  Write a ``0`` to this
    register to disable individual events.

    .. wavedrom::
        :caption: ETHMAC_SRAM_READER_EV_ENABLE

        {
            "reg": [
                {"name": "event0",  "bits": 1},
                {"bits": 31}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


+-------+--------+----------------------------------------------+
| Field | Name   | Description                                  |
+=======+========+==============================================+
| [0]   | EVENT0 | Write a ``1`` to enable the ``event0`` Event |
+-------+--------+----------------------------------------------+

ETHMAC_PREAMBLE_CRC
^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x38 = 0xf0002038`


    .. wavedrom::
        :caption: ETHMAC_PREAMBLE_CRC

        {
            "reg": [
                {"name": "preamble_crc", "attr": 'reset: 1', "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


ETHMAC_RX_DATAPATH_PREAMBLE_ERRORS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x3c = 0xf000203c`


    .. wavedrom::
        :caption: ETHMAC_RX_DATAPATH_PREAMBLE_ERRORS

        {
            "reg": [
                {"name": "rx_datapath_preamble_errors[31:0]", "bits": 32}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


ETHMAC_RX_DATAPATH_CRC_ERRORS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0002000 + 0x40 = 0xf0002040`


    .. wavedrom::
        :caption: ETHMAC_RX_DATAPATH_CRC_ERRORS

        {
            "reg": [
                {"name": "rx_datapath_crc_errors[31:0]", "bits": 32}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


