.class public Lmicro09;
.super Ljava/lang/Object;
.source "micro09.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 3
    move-object v0, p0

    move-object v1, v0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 16

    .prologue
    .line 7
    move-object v0, p0

    new-instance v8, Ljava/util/Scanner;

    move-object v14, v8

    move-object v8, v14

    move-object v9, v14

    sget-object v10, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v9, v10}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    move-object v1, v8

    .line 8
    const-wide/16 v8, 0x0

    move-wide v6, v8

    .line 10
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v9, "Digite o preco: "

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 11
    move-object v8, v1

    invoke-virtual {v8}, Ljava/util/Scanner;->nextDouble()D

    move-result-wide v8

    move-wide v2, v8

    .line 12
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v9, "Digite a venda: "

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 13
    move-object v8, v1

    invoke-virtual {v8}, Ljava/util/Scanner;->nextDouble()D

    move-result-wide v8

    move-wide v4, v8

    .line 15
    move-wide v8, v4

    const-wide v10, 0x407f400000000000L    # 500.0

    cmpg-double v8, v8, v10

    if-ltz v8, :cond_3a

    move-wide v8, v2

    const-wide/high16 v10, 0x403e000000000000L    # 30.0

    cmpg-double v8, v8, v10

    if-gez v8, :cond_61

    .line 16
    :cond_3a
    move-wide v8, v2

    const-wide v10, 0x3fb999999999999aL    # 0.1

    move-wide v12, v2

    mul-double/2addr v10, v12

    add-double/2addr v8, v10

    move-wide v6, v8

    .line 26
    :cond_44
    :goto_44
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuffer;

    move-object v14, v9

    move-object v9, v14

    move-object v10, v14

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "O novo preco e: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    move-wide v10, v6

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    return-void

    .line 18
    :cond_61
    move-wide v8, v4

    const-wide v10, 0x407f400000000000L    # 500.0

    cmpl-double v8, v8, v10

    if-ltz v8, :cond_75

    move-wide v8, v4

    const-wide v10, 0x4092c00000000000L    # 1200.0

    cmpg-double v8, v8, v10

    if-ltz v8, :cond_83

    :cond_75
    move-wide v8, v2

    const-wide/high16 v10, 0x403e000000000000L    # 30.0

    cmpl-double v8, v8, v10

    if-ltz v8, :cond_8e

    move-wide v8, v2

    const-wide/high16 v10, 0x4054000000000000L    # 80.0

    cmpg-double v8, v8, v10

    if-gez v8, :cond_8e

    .line 19
    :cond_83
    move-wide v8, v2

    const-wide v10, 0x3fc3333333333333L    # 0.15

    move-wide v12, v2

    mul-double/2addr v10, v12

    add-double/2addr v8, v10

    move-wide v6, v8

    goto :goto_44

    .line 21
    :cond_8e
    move-wide v8, v4

    const-wide v10, 0x4092c00000000000L    # 1200.0

    cmpl-double v8, v8, v10

    if-gez v8, :cond_9f

    move-wide v8, v2

    const-wide/high16 v10, 0x4054000000000000L    # 80.0

    cmpl-double v8, v8, v10

    if-ltz v8, :cond_44

    .line 22
    :cond_9f
    move-wide v8, v2

    const-wide v10, 0x3fc999999999999aL    # 0.2

    move-wide v12, v2

    mul-double/2addr v10, v12

    sub-double/2addr v8, v10

    move-wide v6, v8

    goto :goto_44
.end method
