// Copyright (c) 2018-2021 The Dash Core developers
// Copyright (c) 2020-2022 The Skytere developers
// Distributed under the MIT/X11 software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef SKYTERE_QUORUMS_INIT_H
#define SKYTERE_QUORUMS_INIT_H

class CDBWrapper;
class CEvoDB;

namespace llmq
{

// Init/destroy LLMQ globals
void InitLLMQSystem(CEvoDB& evoDb, bool unitTests, bool fWipe = false);
void DestroyLLMQSystem();

// Manage scheduled tasks, threads, listeners etc.
void StartLLMQSystem();
void StopLLMQSystem();
void InterruptLLMQSystem();
} // namespace llmq

#endif //SKYTERE_QUORUMS_INIT_H
