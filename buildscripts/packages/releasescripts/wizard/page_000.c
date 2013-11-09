#include "e.h"
#include "e_mod_main.h"

/* local function prototypes */
static Eina_Bool _cb_next_page(void *data __UNUSED__);

EAPI int 
wizard_page_init(E_Wizard_Page *pg __UNUSED__) 
{
   return 1;
}

EAPI int 
wizard_page_shutdown(E_Wizard_Page *pg __UNUSED__) 
{
   return 1;
}

EAPI int 
wizard_page_show(E_Wizard_Page *pg __UNUSED__) 
{
   e_wizard_title_set(_("Bodhi Linux"));
   e_wizard_button_next_enable_set(0);
   ecore_timer_add(2.0, _cb_next_page, NULL);
   return 1;
}

EAPI int 
wizard_page_hide(E_Wizard_Page *pg __UNUSED__) 
{
   return 1;
}

EAPI int 
wizard_page_apply(E_Wizard_Page *pg __UNUSED__) 
{
   return 1;
}

/* local function prototypes */
static Eina_Bool 
_cb_next_page(void *data __UNUSED__) 
{
   e_wizard_button_next_enable_set(EINA_TRUE);
   e_wizard_next();
   return ECORE_CALLBACK_CANCEL;
}
