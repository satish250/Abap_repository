CLASS zcl_clrunrap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clrunrap IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

TRY.
FINAL(api) = cl_aic_islm_compl_api_factory=>get( )->create_instance( 'ZISLM_IB_TEST' ).
CATCH cx_aic_api_factory INTO DATA(lx_aic_api_factory).
out->write( lx_aic_api_factory->get_longtext( ) ).
RETURN.
ENDTRY.
FINAL(params) = api->get_parameter_setter( ).
params->set_temperature( '0.5' ).
TRY.
FINAL(answer) = api->execute_for_string( 'Show me an ADAP Classrun sample using interface if_oo_adt_classrun?' )->get_completion( ).
out->write( answer ).
CATCH cx_aic_completion_api INTO DATA(lx_aic_completion_api).
out->write( lx_aic_completion_api->get_longtext( ) ).
ENDTRY.

  ENDMETHOD.
ENDCLASS.
