package kz.statbase.estat.spravgenerator2.filters

import kz.statbase.estat.catreg.RespInfoController
import kz.statbase.estat.relict.values.PullUpGateController
import kz.statbase.estat.spravgenerator2.model.CatalogGetterController
import kz.statbase.estat.util.OrDslController

import javax.servlet.http.HttpServletRequest


/**
 *  Фильтр ограничевает доступ к сервисам SpravGen2
 *  для всех респов доступны только 4 контроллера
 *  для локальной сети ИВЦ доступны все остальные контроллеры
 */
class OnlyIvcAccessFilters {

    boolean isCatalogGetter(HttpServletRequest request) {
        return request.requestURI.toLowerCase().contains(CatalogGetterController.CATALOG_GETTER_URI);

    }

    boolean isPullUpGetter(HttpServletRequest request) {
        return request.requestURI.toLowerCase().contains(PullUpGateController.GETTER_URI);

    }

    boolean isRespGetter(HttpServletRequest request) {
        return request.requestURI.toLowerCase().contains(RespInfoController.GETTER_URI);

    }

    boolean isOrDslGetter(HttpServletRequest request) {
        return request.requestURI.toLowerCase().contains(OrDslController.GETTER_URI);

    }

    boolean isLocalOrIvcNetwork(HttpServletRequest request) {
        String result = ["127.0.0.1", "0:0:0:0:0:0:0:1", "172.0.", "172.16.", "172.",].find {
            return request.remoteAddr.startsWith(it)
        }
        return result;

    }

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                //if ( !["127.0.0.1", "0:0:0:0:0:0:0:1", "172.0."].contains(request.remoteAddr) &&
                if (isLocalOrIvcNetwork(request) ||
                        isCatalogGetter(request) ||
                        isPullUpGetter(request) ||
                        isOrDslGetter(request) ||
                        isRespGetter(request)) {
                    return true;
                }
                render(status: 403, text: 'Access limited only by IVC.')
                return false
            }

            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
