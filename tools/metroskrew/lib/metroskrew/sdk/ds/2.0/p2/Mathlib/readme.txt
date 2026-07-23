Floating point library selection guide
======================================

A. Select the architecture

  1. "xM":  ARM v4 xM with no thumb interworking. This is the "lowest common 
     denominator" option - slow, but compatible with all ARM7 or higher cores.

  2. "v4t": ARM v4 with thumb interworking (default). Requires ARM7TDMI or 
     higher cores.

  3. "v5t": ARM v5 with thumb interworking. Requires ARM10/XScale or higher cores.



B. Select the endianness 
  1. "LE": little endian
  2. "BE": big endian
  


C. Select the IEEE compliance mode

  1. "flush0": Flush to zero (default). It is not IEEE compatible. The library 
     behaves like the VFP processor in RunFast mode.

     IEEE finite values are accurate, with rounding to nearest and no exceptions. 
     Subnormals are flushed to zero on input and output. It is not guaranteed 
     that NaNs and infinities are produced in all circumstances defined by the 
     IEEE model. Also, it is not guaranteed that the sign of zero is that 
     predicted by the IEEE model. 
  
  2. "fastI": Fast IEEE. 
  
     The default mode specified in the IEEE standard. Outputs are conforming to 
     IEEE. Rounding mode is round-to-nearest and there are no exceptions.
     
     Speed: As fast as "flush0" on normal (finite) inputs.
     Size:  Up to 20% larger than "flush0"
  
  3. "fixedI": Fixed rounding IEEE. 
  
     The overflow, underflow, division-by-zero and invalid operation exceptions 
     are generated conforming to the IEEE standard. Only round-to-nearest mode 
     is supported; modes of operation cannot be selected dynamically.
     
     Speed: Up to 20% slower than "flush0" 
     Size:  Up to 65% larger than "flush0"
  
  4. "fullI": Full IEEE.
  
     All facilities, operations, and representations guaranteed by the IEEE 
     standard are available in single and double-precision. Modes of operation 
     can be selected dynamically at run-time. 
     
     Speed: Up to 100% slower than "flush0" 
     Size:  Up to 100% larger than "flush0"



Floating point library naming convention:
=========================================

  FP_{IEEE compliance}_{architecture}_{endianness}.a

 IEEE compliance: same convention as the RVCT libraries
  - "flush0" : flush to zero
  - "fastI"  : fast IEEE   
  - "fixedI" : fixed rounding IEEE
  - "fullI"  : full IEEE

 Architecture:
  - "v4t"   : ARM7TDMI
  - "xM"    : ARM7xM (for processors without thumb/multiplier)
  - "v5t"   : ARM10 / XScale

 Endianness: "LE" / "BE"

Examples: 
 - fast IEEE ARM7TDMI little endian library: FP_fastI_v4t_LE.a.
 - full IEEE XScale big endian library:      FP_fullI_v5t_BE.a

