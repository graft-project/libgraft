INCLUDEPATH += $$PWD/include \
               $$PWD/include/epee \
               $$PWD/include/external/easylogging++ \
	       $$PWD/include/wallet

android {
    INCLUDEPATH += $$PWD/include/external/android 
    LIBS += -L$$PWD/lib/graft/android/$$ANDROID_TARGET_ARCH \
	    -lepee \
	    -lwallet \
	    -lwallet_merged \
	    -lutils \
	    -lcncrypto \
	    -leasylogging \
	    -lunbound \
	    -llmdb \
	    -lsodium

    LIBS += -L$$PWD/lib/boost/android/$$ANDROID_TARGET_ARCH/
    LIBS += -lboost_filesystem \
            -lboost_program_options \
            -lboost_regex \
            -lboost_serialization \
            -lboost_system \
            -lboost_thread \
	    -lboost_chrono

    LIBS += -L$$PWD/lib/openssl/android/$$ANDROID_TARGET_ARCH/ \
	    -lssl -lcrypto

    
} else {
    linux {
        # XXX: order matters (epee first), wont link otherwise (undefined reference to easylogging)
	LIBS += -L$$PWD/lib/graft/linux \
	LIBS += -lwallet_merged -leasylogging -lepee -lunbound -llmdb -lssl -lcrypto -lsodium
	LIBS += -lboost_filesystem \
            -lboost_program_options \
            -lboost_regex \
            -lboost_serialization \
            -lboost_system \
            -lboost_thread
	    
	
    }
}

ios {
    LIBS += -L$$PWD/lib/graft/ios \
	    -leasylogging \
	    -lepee \
	    -lcncrypto \
	    -lwallet_merged \
	    -lunbound	
    LIBS += -L$$PWD/lib/openssl/lib/ios -lcrypto -lssl
    LIBS += -L$$PWD/lib/boost/lib/ios -lboost

} else {
    mac {
	LIBS += -L$$PWD/../libwallet/wallet/mac -leasylogging -lepee
	LIBS += -L$$PWD/lib/mac -lcncrypto

	LIBS += -L$$PWD/lib/graft/mac -lwallet_merged -leasylogging -lepee -lunbound
	LIBS += -L$$PWD/lib/openssl/mac -lcrypto -lssl
	LIBS += -L$$PWD/lib/boost/mac \
            -lboost_system \
            -lboost_program_options \
            -lboost_filesystem \
            -lboost_serialization \
            -lboost_thread-mt \
            -lboost_regex
    }
}

