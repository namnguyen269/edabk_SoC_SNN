SDMEM2BLOCK
===========

Register Listing for SDMEM2BLOCK
--------------------------------

+--------------------------------------------------------+--------------------------------------------+
| Register                                               | Address                                    |
+========================================================+============================================+
| :ref:`SDMEM2BLOCK_DMA_BASE1 <SDMEM2BLOCK_DMA_BASE1>`   | :ref:`0xf0005800 <SDMEM2BLOCK_DMA_BASE1>`  |
+--------------------------------------------------------+--------------------------------------------+
| :ref:`SDMEM2BLOCK_DMA_BASE0 <SDMEM2BLOCK_DMA_BASE0>`   | :ref:`0xf0005804 <SDMEM2BLOCK_DMA_BASE0>`  |
+--------------------------------------------------------+--------------------------------------------+
| :ref:`SDMEM2BLOCK_DMA_LENGTH <SDMEM2BLOCK_DMA_LENGTH>` | :ref:`0xf0005808 <SDMEM2BLOCK_DMA_LENGTH>` |
+--------------------------------------------------------+--------------------------------------------+
| :ref:`SDMEM2BLOCK_DMA_ENABLE <SDMEM2BLOCK_DMA_ENABLE>` | :ref:`0xf000580c <SDMEM2BLOCK_DMA_ENABLE>` |
+--------------------------------------------------------+--------------------------------------------+
| :ref:`SDMEM2BLOCK_DMA_DONE <SDMEM2BLOCK_DMA_DONE>`     | :ref:`0xf0005810 <SDMEM2BLOCK_DMA_DONE>`   |
+--------------------------------------------------------+--------------------------------------------+
| :ref:`SDMEM2BLOCK_DMA_LOOP <SDMEM2BLOCK_DMA_LOOP>`     | :ref:`0xf0005814 <SDMEM2BLOCK_DMA_LOOP>`   |
+--------------------------------------------------------+--------------------------------------------+
| :ref:`SDMEM2BLOCK_DMA_OFFSET <SDMEM2BLOCK_DMA_OFFSET>` | :ref:`0xf0005818 <SDMEM2BLOCK_DMA_OFFSET>` |
+--------------------------------------------------------+--------------------------------------------+

SDMEM2BLOCK_DMA_BASE1
^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0005800 + 0x0 = 0xf0005800`

    Bits 32-63 of `SDMEM2BLOCK_DMA_BASE`.

    .. wavedrom::
        :caption: SDMEM2BLOCK_DMA_BASE1

        {
            "reg": [
                {"name": "dma_base[63:32]", "bits": 32}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


SDMEM2BLOCK_DMA_BASE0
^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0005800 + 0x4 = 0xf0005804`

    Bits 0-31 of `SDMEM2BLOCK_DMA_BASE`.

    .. wavedrom::
        :caption: SDMEM2BLOCK_DMA_BASE0

        {
            "reg": [
                {"name": "dma_base[31:0]", "bits": 32}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


SDMEM2BLOCK_DMA_LENGTH
^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0005800 + 0x8 = 0xf0005808`


    .. wavedrom::
        :caption: SDMEM2BLOCK_DMA_LENGTH

        {
            "reg": [
                {"name": "dma_length[31:0]", "bits": 32}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


SDMEM2BLOCK_DMA_ENABLE
^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0005800 + 0xc = 0xf000580c`


    .. wavedrom::
        :caption: SDMEM2BLOCK_DMA_ENABLE

        {
            "reg": [
                {"name": "dma_enable", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


SDMEM2BLOCK_DMA_DONE
^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0005800 + 0x10 = 0xf0005810`


    .. wavedrom::
        :caption: SDMEM2BLOCK_DMA_DONE

        {
            "reg": [
                {"name": "dma_done", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


SDMEM2BLOCK_DMA_LOOP
^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0005800 + 0x14 = 0xf0005814`


    .. wavedrom::
        :caption: SDMEM2BLOCK_DMA_LOOP

        {
            "reg": [
                {"name": "dma_loop", "bits": 1},
                {"bits": 31},
            ], "config": {"hspace": 400, "bits": 32, "lanes": 4 }, "options": {"hspace": 400, "bits": 32, "lanes": 4}
        }


SDMEM2BLOCK_DMA_OFFSET
^^^^^^^^^^^^^^^^^^^^^^

`Address: 0xf0005800 + 0x18 = 0xf0005818`


    .. wavedrom::
        :caption: SDMEM2BLOCK_DMA_OFFSET

        {
            "reg": [
                {"name": "dma_offset[31:0]", "bits": 32}
            ], "config": {"hspace": 400, "bits": 32, "lanes": 1 }, "options": {"hspace": 400, "bits": 32, "lanes": 1}
        }


