#ifndef E_MOD_MAIN_H
#define E_MOD_MAIN_H

#define E_TYPEDEFS 1
#include "e_wizard.h"

#undef E_TYPEDEFS
#include "e_wizard.h"


EAPI extern E_Module_Api e_modapi;
EAPI extern const char *default_e_theme;

EAPI void *e_modapi_init     (E_Module *m);
EAPI int   e_modapi_shutdown (E_Module *m);
EAPI int   e_modapi_save     (E_Module *m);

#endif
